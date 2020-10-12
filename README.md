# My .dotfiles

* [`.config/`](.config/): config files that don't need to live in `$HOME`
  * [`bash/`](.config/bash): bash shell specific
    * [`all.bash`](.config/bash/all.bash): sources all other files here
    * [`plugins.bash`](.config/bash/plugins.bash): sources extra bash plugins
    * [`prompt.bash`](.config/bash/prompt.bash): sets bash prompt
    * [`settings.bash`](.config/bash/settings.bash): sets bash-specific settings 
  * [`shell/`](.config/shell): shell agnostic common startup scripts
    * [`aliases.sh`](.config/shell/aliases.sh): shell aliases
    * [`all.sh`](.config/shell/all.sh): sources all other files here
    * [`env`](.config/shell/env.sh): sets environment variables
    * [`functions`](.config/shell/functions.sh): defines shell functions
  * [`zsh/`](.config/zsh): zsh shell specific
    * [`all.zsh`](.config/zsh/all.zsh): sources all other files here
    * [`plugins.zsh`](.config/zsh/plugins.zsh): sources extra zsh plugins
    * [`prompt.zsh`](.config/zsh/prompt.zsh): sets zsh prompt
    * [`settings.zsh`](.config/zsh/settings.zsh): sets zsh-specific settings 
  * [`starship.toml`](.config/starship.toml):
    [Starhsip](https://starship.rs/) shell prompt config
* [`.local/bin/`](.local/bin/): custom shell scripts added to the `$PATH`
  * [`install-starship`](.local/bin/install-starship): Starship prompt installer
* [`.bash_profile`](.bash_profile): sourced for login interactive bash
* [`.bashrc`](.bashrc): sourced for non-login interactive bash
* [`.gitconfig`](.gitconfig): global git aliases and configs
* [`.gitignore_global`](.gitignore_global): global generic gitignore
* [`.pythonrc.py`](.pythonrc.py): sourced for interactive Python REPL
* [`.tmux.conf`](.tmux.conf): tmux configuration
* [`.vimrc`](.vimrc): vim configuration
* [`.zshrc`](.zshrc): sourced for non-logi interactive zsh
* [`README.md`](README.md): this file

## Setup on existing machines

Get prerequisites:

```shell
apt update -y && apt install -y git curl
```

Setup:

```shell
# Get .dotfiles
git clone https://github.com/palotasb/dotfiles $HOME/.dotfiles

# Back up old .dotfiles that we will overwrite
git --work-tree $HOME/.dotfiles --git-dir $HOME/.dotfiles/.git ls-files | \
    xargs -I FILE sh -c "if [ -f "$HOME/FILE" ]; then echo "FILE"; fi" | \
    xargs -I FILE sh -c "DATE=$(date +%Y-%m-%d-%H-%M-%S) ; DIR=./.bak-\$DATE ; mkdir -p \$(dirname \"\$DIR/FILE\") ; cp -a \"$HOME/FILE\" \"\$DIR/FILE\" ; echo \"FILE\""

# Use global `config` alias to manage .dotfiles in $HOME
alias config="git --work-tree $HOME --git-dir $HOME/.dotfiles/.git"

# Ignore all other files in $HOME
config config status.showUntrackedFiles no

# Overwrite config with stored data
config reset --hard

# Source into current bash or zsh shell
if ( echo $0 | grep -qE "(^|/)bash$" ) ; then
  source $HOME/.bashrc
elif ( echo $0 | grep -qE "(^|/)bash$" ) ; then
  source $HOME/.zshrc
fi

# Install https://starship.rs/ for custom prompt
install-starship

#
config-source
```

## Initial setup