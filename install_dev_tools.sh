#! /bin/bash
#This script is used to check if specific development tools are installed and install them if needed"

arr=(docker docker-compose python3 django-admin)

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
        echo "$item: not installed. Do you agree to install $item y/n ?"
        read answer
        if [ "$answer" = "y" ]; then
            echo "let install"
        else 
            echo "ok, skipping"
        fi
    fi
done

