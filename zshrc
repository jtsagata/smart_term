# Awesome zsh list
# https://github.com/unixorn/awesome-zsh-plugins

# Initialize plugins
# Run zplug install on change
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "MenkeTechnologies/zsh-cargo-completion"
zplug "conda-incubator/conda-zsh-completion"
zplug "chrissicool/zsh-256color"
zplug load

source ~/.automation/automation.zsh