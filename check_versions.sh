#! /bin/bash


# Check versions
arr=(docker django-admin docker-compose python3 )

check_versions () {
    missing=()
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
