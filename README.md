# Dotfiles

This repository contains a collection of [dotfiles](https://dotfiles.github.io/) and scripts used to configure and customize my OS X environment.

## Features

[Prezto](https://github.com/sorin-ionescu/prezto), the configuration framework for Zsh, is used and will be automatically installed if not detected.

**Two main scripts are available:**

### `install`

This script is meant to be used after a fresh install of macOS and will automatically install all your applications from Chrome to `jq` and configure your environment settings.

### `configure`

This script will install Prezto if necessary, automatically symlink all dotfiles included in this repository to their assumed location and install some useful scripts to your system.

Regarding Neovim, if not installed, [Packer](https://github.com/wbthomason/packer.nvim/), a Vim plugin manager will also be installed automatically.

Included dotfiles:

- All [Zsh configuration](http://zsh.sourceforge.net/Intro/intro_3.html#SEC3)
- All [Prezto](https://github.com/sorin-ionescu/prezto) configuration
- [Streamlink configuration](https://streamlink.github.io/cli/config.html)
- [.wgetrc](https://www.gnu.org/software/wget/manual/html_node/Wgetrc-Commands.html)
- [.config/nvim/init.lua](https://neovim.io/doc/user/starting.html#init.lua)
- [.gitconfig](https://git-scm.com/docs/git-config)
- [.backupignore](https://borgbackup.readthedocs.io/en/stable/usage/help.html?highlight=fnmatch#borg-help-patterns)
- [.hushlogin](https://man7.org/linux/man-pages/man1/login.1.html)

Included scripts:

- `imgcat`: Script showing inline images in iTerm2 v3.
- `+x`: Script to quickly add execution permissions to a file.
- `mit`: Script to generate an MIT license file.
- `backup`: Script using [Borg](https://borgbackup.readthedocs.io/) to create deduplicating backups every night.

## Usage & customization

_Note: To properly customize the scripts, you should fork this repository and modify it to fit your needs and include your own configuration. You can also copy whatever portion of script / configuration that you find useful._

To install, just clone the repository and set the correct permissions:

```console
$ git clone https://github.com/HiDeoo/dotfiles
$ cd dotfiles
```

_Note: Make sure to backup your existing dotfiles or add all your configurations in your forked repository before using the `configure` script as it will erase the current ones._

Use either the `install` or `configure` script:

```console
$ ./install
```

```console
$ ./configure
```

### `install` script

This script will launch the following scripts located in the `setup` folders:

- `xcode.sh`: Install the XCode Command Line Tools.
- `homebrew.sh`: Install [Homebrew](https://brew.sh/).
- `formulas.sh`: Install various Homebrew Formulas. This is the file to edit to define all the Formulas you want to install.
- `casks.sh`: Install various Casks. This is the file to edit to define all the Casks you want to install.
- `settings.sh`: Configure all your environment settings. This is the file to edit to enable / disable some customizations and define your own.

### `configure` script

The dotfiles & custom scripts installation is made using [Dotbot](https://github.com/anishathalye/dotbot). The `configure` script will automatically call Dotbot using the `.configure.yaml` file which contains all steps of the process.

This file allow you to configure every steps of the process by defining how dotfiles should be set up, what shell commands should be executed, etc.

You can find more informations on the [Dotbot repository](https://github.com/anishathalye/dotbot).

## Resources

- [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles)
- [nicksp/dotfiles](https://github.com/nicksp/dotfiles)
- [necolas/dotfiles](https://github.com/necolas/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [alrra/dotfiles](https://github.com/alrra/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [jacobwgillespie/dotfiles](https://github.com/jacobwgillespie/dotfiles)

## License

Code released under the [MIT license](https://github.com/HiDeoo/dotfiles/blob/main/LICENSE.md).
