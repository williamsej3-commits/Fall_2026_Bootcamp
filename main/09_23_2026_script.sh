#!/bin/bash
echo "hello world"
echo ""

echo "Welcome to the Training Menu"
echo "1) Check system information"
echo "2) Check current directory"
echo "3) Check current user"
echo "4) Exit"

read -p "Enter your choice [1-4]: " choice

# Conditional logic
if [[ -z "$choice" ]]; then
    echo "You did not enter a selection."
    exit 1
fi

# Case statement
case "$choice" in
    1)
        echo "System information:"
        uname -a
        ;;
    2)
        echo "Your current directory is:"
        pwd
        ;;
    3)
        echo "The current user is:"
        whoami
        ;;
    4)
        echo "Exiting program."
        exit 0
        ;;
    *)
        echo "Invalid selection. Please choose 1 through 4."
        ;;
esac
