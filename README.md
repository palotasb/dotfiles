# Dotfiles

```shell
$ git clone https://github.com/palotasb/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install
```

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot][dotbot] for installation.

Making Local Customizations
---------------------------

You can make [local][dotfiles-local] customizations for some programs by editing these files:

* `vim` : `~/.vimrc_local`
* `zsh` / `bash` : `~/.shell_local_before` run first
* `zsh` : `~/.zshrc_local_before` run before `.zshrc`
* `zsh` : `~/.zshrc_local_after` run after `.zshrc`
* `zsh` / `bash` : `~/.shell_local_after` run last
* `git` : `~/.gitconfig_local`
* `tmux` : `~/.tmux_local.conf`

License
-------

Copyright (c) 2020 Palotás Boldizsár.
Copyright (c) 2013-2020 Anish Athalye. Released under the MIT License. See
[LICENSE.md][license] for details.

[dotfiles-local]: https://github.com/anishathalye/dotfiles-local
[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE.md
