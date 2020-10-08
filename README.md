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

```shell
git clone https://github.com/palotasb/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles/
```

## Initial setup