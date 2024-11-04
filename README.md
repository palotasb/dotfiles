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
    [Starship](https://starship.rs/) shell prompt config
* [`.local/bin/`](.local/bin/): custom shell scripts added to the `$PATH`
  * [`install-starship`](.local/bin/install-starship): Starship prompt installer
* [`.bash_profile`](.bash_profile): sourced for login interactive bash
* [`.bashrc`](.bashrc): sourced for non-login interactive bash
* [`.gitconfig`](.gitconfig): global git aliases and configs
* [`.gitignore_global`](.gitignore_global): global generic gitignore
* [`.pythonrc.py`](.pythonrc.py): sourced for interactive Python REPL
* [`.tmux.conf`](.tmux.conf): tmux configuration
* [`.vimrc`](.vimrc): vim configuration
* [`.zshrc`](.zshrc): sourced for non-login interactive zsh
* [`README.md`](README.md): this file

## Setup on existing machines

Get prerequisites:

```shell
apt update -y && apt install -y git curl
```

Setup using the
[`setup-dotfiles`](.local/bin/setup-dotfiles)
convenience script:

```shell
eval "$(curl -fsSL https://raw.githubusercontent.com/palotasb/dotfiles/master/.local/bin/setup-dotfiles)"
```

## Initial setup

```shell
git init $HOME/.dotfiles
alias config="git --work-tree $HOME --git-dir $HOME/.dotfiles/.git"
```

## Local overrides initial setup

```shell
git init $HOME/.dotfiles-local
alias config-local="git --work-tree $HOME --git-dir $HOME/.dotfiles-local/.git"
config-local config status.showUntrackedFiles no
```

## References

* [Ask HN: What do you use to manage dotfiles?](https://news.ycombinator.com/item?id=11070797)
* [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
