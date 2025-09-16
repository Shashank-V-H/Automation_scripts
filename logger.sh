#!/bin/bash

# Disable terminal echoing for input (so keys are not shown on the screen)
stty -echo

# Inform the user
echo "Keylogger started. Press Ctrl+C to stop."

# Infinite loop to capture key presses
while true; do
    # Read a single key
    read -n 1 key

    # Print the key pressed
    if [[ "$key" == $'\x03' ]]; then
        # If it's Ctrl+C (Exit condition)
        echo "Exiting keylogger."
        break
    elif [[ "$key" == $'\x0a' ]]; then
        # Handle Enter key
        echo -e "\nEnter key pressed"
    elif [[ "$key" == " " ]]; then
        # Handle space key
        echo -e "\nSpace key pressed"
    else
        # Print the character of the key pressed
        echo -e "\nKey pressed: $key"
    fi
done

# Re-enable terminal echoing
stty echo
