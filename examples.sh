rm -rf $HOME/.* $HOME/*

DOTFILES_REPO=https://github.conti.de/uib58003/dotfiles.git eval "$(curl -fsSL https://github.conti.de/raw/uib58003/dotfiles/master/.local/bin/setup-dotfiles)"

DOTFILES=conti-local DOTFILES_REPO=https://github.conti.de/uib58003/dotfiles.git eval "$(curl -fsSL https://github.conti.de/raw/uib58003/dotfiles/master/.local/bin/setup-dotfiles)"

config remote get-url origin
