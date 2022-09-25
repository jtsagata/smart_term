# shellcheck shell=bash
AUTOMATION_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")

# Add the following lines to .bashrc
# # shellcheck source=/dev/null
# source ~/.automation/automation.sh load

function path_add() {
    if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)"; then
        if [ "$2" = "after" ]; then
            PATH="$PATH:$1"
        else
            PATH="$1:$PATH"
        fi
    fi
}

path_add "${AUTOMATION_DIR}/bin"

### Get the SHELL NAME
if [ -n "$BASH" ]; then
    export SHELL_NAME="bash"
elif [ -n "$ZSH_NAME" ]; then
    export SHELL_NAME="zsh"
elif [ -n "$FISH_VERSION" ]; then
    export SHELL_NAME="fish"
fi

# All the action is here
function cmd_load() {
    # shellcheck source=/dev/null
    source "${AUTOMATION_DIR}/modules/mod_tool" load
}

function cmd_modules() {
    # shellcheck source=/dev/null
    source "${AUTOMATION_DIR}/modules/mod_tool" "$@"
}


command=${1-help}
shift || true
func=cmd_"${command}"
if [ "$(type -t "$func")" == "function" ]; then
    $func "$@"
fi


# This is sourced, so remove garbage
unset AUTOMATION_DIR cmd_load
