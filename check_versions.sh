#! /bin/bash


# Check versions
check_versions () {
    for item in "${arr[@]}"; do
        base="${item%% *}"  # for commands that consiste of more than 1 word like "docker compose"

        # Check if command exists
        if ! command -v "$base" >/dev/null 2>&1; then
            missing+=("$item")
            continue
        fi

        # Handling for Python3 (> 3.9)
        if [[ "$item" == "python3" ]]; then
            if ! python3 -c 'import sys; exit(0 if sys.version_info > (3,9) else 1)'; then
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

