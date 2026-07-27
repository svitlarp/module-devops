#! /bin/bash

readonly REQUIRED_PYTHON_VERSION="${REQUIRED_PYTHON_VERSION:-3.9}" 


# Check versions
check_versions () {
    local items=("$@")

    for item in "${items[@]}"; do
        base="${item%% *}"  # for commands that consiste of more than 1 word like "docker compose"

        # Check if command exists
        if ! command -v "$base" >/dev/null 2>&1; then
            missing+=("$item")
            continue
        fi

        # Handling for Python3 (> 3.9)
        if [[ "$item" == "python3" ]]; then

            PYTHON_VERSION=$(python3 --version | awk '{print $2}')
            PYTHON_MAJOR_MINOR=$(echo "$PYTHON_VERSION" | cut -d. -f1,2)

            if [[ "$(printf '%s\n' "$REQUIRED_PYTHON_VERSION" "$PYTHON_MAJOR_MINOR" | sort -V | head -n1)" != "$REQUIRED_PYTHON_VERSION" ]]; then
                missing+=("$item")
            else 
                echo "Check python3: $(python3 --version)"
            fi
            continue
        fi

        # Other commands
        if output=$($item --version 2>&1); then
            echo "Check $item: $output"
        elif output=$($item version 2>&1); then
            echo "Check $item: $output"
        elif output=$($item -V 2>&1); then
            echo "Check $item: $output"
        else
            echo "Check $item: installed, version unknown"
        fi
    done
}

