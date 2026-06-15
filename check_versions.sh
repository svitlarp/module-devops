#! /bin/bash


# Check versions

check_versions () {
    for item in "${arr[@]}"; do
        if command -V "$item" >/dev/null 2>&1; then
            if output=$("$item" -V 2>&1); then
                echo "Check $item: $output"
            elif output=$("$item" --version 2>&1); then
                echo "Check $item: $output"
            else
                echo "Check $item: installed, version unknown"
            fi
        else
            missing+=("$item")
        fi
    done
}

