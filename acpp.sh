##########################################################################
# File Name: acpp.sh
# Author: houyichao
# mail: houyichaochao@gmail.com
# Created Time: 二  1/16 09:44:05 2024
# Last modified: 2024-01-16 09:44:05
# Description:
#########################################################################
#!/bin/sh

trap 'echo "Received SIGINT signal and exiting..."; exit 1' INT

TYPE=$(gum choose "fix" "cr-fix" "feat" "optimize" "style" "refactor" "revert")
# SCOPE=$(gum input --placeholder "scope")
# UX: 用户体验
# Chore：日常维护
SCOPE=$(gum choose "Common" "Code" "Comment" "Log" "Properties" "Pom" "Docs") 

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

# Commit these changes
gum confirm "Commit changes?" && git add . &&  git commit -m "$SUMMARY" -m "$DESCRIPTION" && git push
