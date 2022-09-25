#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")

# Add the following lines to .bashrc
# # shellcheck source=/dev/null
# source ~/.automation/automation.sh

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/modules/mod_tool" load