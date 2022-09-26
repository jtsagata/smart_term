# shellcheck shell=sh
AUTOMATION_DIR=${0:a:h}


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

### Export TERM_PROGRAM
if [ -z "${TERM_PROGRAM}" ]; then
    if [[ "${TERMINAL_EMULATOR}" == "JetBrains-JediTerm" ]]; then
        export TERM_PROGRAM="JetBrains"
    elif [[ -v INSIDE_NAUTILUS_PYTHON ]]; then
        export TERM_PROGRAM="nautilus"
    else
        export TERM_PROGRAM="gnome"
    fi
fi

# Load modules
for filename in "$AUTOMATION_DIR"/modules/enabled/*; do
    if [ -e "$filename" ]; then
        # shellcheck disable=SC1090
        source "$filename"
    fi
done
