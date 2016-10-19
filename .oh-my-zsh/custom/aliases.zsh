alias vim=nvim

# Vim
alias vimrc="vim ~/.config/nvim/init.vim"
alias vimrc-core="vim ~/.config/nvim/config/core.vimrc"
alias vimrc-appearance="vim ~/.config/nvim/config/appearance.vimrc"
alias vimrc-keys="vim ~/.config/nvim/config/keys.vimrc"
alias vimrc-plugins="vim ~/.config/nvim/config/plugins.vimrc"

# ZSH
alias zshrc="vim ~/.zshrc"
alias zsh-aliases="vim ~/.oh-my-zsh/custom/aliases.zsh"

# Tmux
alias tmuxconf="vim ~/.tmux.conf"

# Xmonad
alias xmonadrc="vim ~/.xmonad/xmonad.hs"
alias xmobarrc="vim ~/.xmonad/xmobar.hs"

# Pass aliases when running sudo
alias sudo='sudo '

# Dots bare repo
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Archy things

# The -s/--syncdeps switch will automatically resolve and install any
# dependencies with pacman before building, -r/--rmdeps removes the
# build-time dependencies after build, as they are no longer needed,
# and -i/--install will install the package itself.
alias mk_install='makepkg -sri'

