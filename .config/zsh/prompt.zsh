# ~/.config/zsh/prompt.zsh

# Prevent Python virtualenv from polluting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

FUNCNEST=100

# eval "$(starship init zsh)"
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
