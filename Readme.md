## Yet another dotfiles automation

## Installation

Keep copies and delete ` ~/.bashrc` and `~/.zshrc`

``` bash 
cd .automation/smart_term
ln bashrc ~/.bashrc
ln zshrcrc ~/.zshrc
cd
```

For **Bash** add to `.bashrc`
``` bash
# shellcheck source=/dev/null
source ~/.automation/smart_term/automation.sh load
```
 Run 
 ``` bash
 ~/.automation/smart_term/automation.zsh
 ```

