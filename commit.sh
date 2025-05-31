
#!/bin/bash

# This script automates the 'git add .' and 'git commit' process.
# It accepts two arguments:
# 1. The first letter of the user's name (e.g., 'a' for Akram).
# 2. The commit message.

# --- Argument Validation ---
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <first_letter_of_user> \"<commit_message>\""
    echo "Example: $0 a \"Initial commit for new feature\""
    exit 1
fi

# Store arguments in variables for clarity
user_initial="$1"
commit_message="$2"

# --- User Configuration ---
# Use a case statement to set Git user.name and user.email based on the initial
case "$user_initial" in
    a|A)
        GIT_USER_NAME="darkwizz-cts"
        GIT_USER_EMAIL="mohamedakram.mohamednazir@cognizant.com"
        ;;
    k|K)
        GIT_USER_NAME="Khushuma099"
        GIT_USER_EMAIL="Khushnuma.Warshi@Cognizant.com"
        ;;
    r|R)
        GIT_USER_NAME="RohitSridhar" # Assuming a name for Rohit as it was missing
        GIT_USER_EMAIL="Rohit.Sridhar@cognizant.com"
        ;;
    p|P)
        GIT_USER_NAME="PiyushSavale-gg"
        GIT_USER_EMAIL="Piyush.Savale@cognizant.com"
        ;;
    w|W)
        GIT_USER_NAME="wazm03"
        GIT_USER_EMAIL="mohamed.umarfaruk@cognizant.com"
        ;;
    *)
        echo "Error: Unknown user initial '$user_initial'."
        echo "Please use 'a', 'k', 'r', 'p', or 'w'."
        exit 1
        ;;
esac

# Set the Git user configuration for the current repository
echo "Setting Git user to: $GIT_USER_NAME <$GIT_USER_EMAIL>"
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# --- Git Operations ---

# Add all changes to the staging area
echo "Adding all files to staging area..."
git add .

# Check if there are any changes to commit
if git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Commit the changes with the provided message
echo "Committing with message: \"$commit_message\""
git commit -m "$commit_message"

# --- Completion Message ---
if [ $? -eq 0 ]; then
    echo "Git operations completed successfully!"
else
    echo "An error occurred during Git operations."
fi
