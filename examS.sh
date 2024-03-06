#!/bin/bash

# Declare applications and processes to be closed
non_permitted_apps=(Messages WhatsApp)
non_permitted_processes=(MessagesActionExtension ServiceExtension)

# Function to check for running applications and quit them
quit_apps() {
  for app in "${non_permitted_apps[@]}"; do
    osascript -e "quit app \"$app\"" || echo "Failed to quit $app"
  done
}

# Function to check for running processes and force quit them
force_quit_processes() {
  for process in "${non_permitted_processes[@]}"; do
    pgrep "$process" >/dev/null && killall "$process" || echo "Process $process not found"
  done
}

# Check for and quit non-permitted applications
quit_apps

# Check for and force quit non-permitted processes if necessary
force_quit_processes

# Inform the user about the actions taken
echo "Non-permitted applications and processes have been closed."
echo "You can now proceed with the Mercer Mettl test."
