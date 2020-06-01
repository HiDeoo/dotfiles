# Dotfiles

This repository contains a collection of [dotfiles](https://dotfiles.github.io/) and scripts used to configure and customize my OS X environment.

## Features

[Prezto](https://github.com/sorin-ionescu/prezto), the configuration framework for Zsh, is used and will be automatically installed if not detected.

Two main scripts are available:

### `configure`

This script will install Prezto if necessary, automatically symlink all dotfiles included in this repository to their assumed location and install some useful scripts to your system.

Regarding Vim, if not installed, [Vundle](https://github.com/VundleVim/Vundle.vim), a Vim plugin manager will also be installed automatically.

Included dotfiles:

  * All [Zsh configuration](http://zsh.sourceforge.net/Intro/intro_3.html#SEC3)
  * All [Prezto](https://github.com/sorin-ionescu/prezto) configuration
  * [.streamlinkrc](https://streamlink.github.io/cli.html#cli-streamlinkrc)
  * [.wgetrc](https://www.gnu.org/software/wget/manual/html_node/Wgetrc-Commands.html)
  * [.vimrc](http://www.vim.org/docs.php)
  * [.gitconfig](https://git-scm.com/docs/git-config)
  * [.vodrc](https://github.com/HiDeoo/vod)

Included scripts:

  * `imgcat`: Script showing inline images in iTerm2 v3.
  * `+x`: Script to quickly add execution permissions to a file.
  * `lc`: Script to generate a license.

### `install`

This script is meant to be used after a fresh install of macOS and will automatically install all your applications from Chrome to Node and configure your environment settings.

## Usage & customization

*Note: To properly customize the scripts, you should fork this repository and modify it to fit your needs and include your own configuration. You can also copy whatever portion of script / configuration that you find useful.*

To install, just clone the repository and set the correct permissions:

```
$ git clone https://github.com/HiDeoo/dotfiles
$ cd dotfiles
$ chmod +x configure install
```

*Note: Make sure to backup your existing dotfiles or add all your configurations in this repository before using the `configure` script as it will erase the current ones.*

Use either the `configure` or `install` script:

```
$ ./configure
```

```
$ ./install
```

## `configure` script

The dotfiles & custom scripts installation is made using [Dotbot](https://github.com/anishathalye/dotbot). The `configure` script will automatically call Dotbot using the `.configure.yaml` file which contains all steps of the process.

```yaml
- shell:
  -
    command: zsh .prezto
    description: Installing Prezto.
    stdout: true
    stderr: true
  -
    command: sh .vundle
    description: Installing Vundle.
    stdout: true
    stderr: true

- link:
    ~/.zlogin:
    ~/.zlogout:
    ~/.zprofile:
    ~/.zshenv:
    ~/.zshrc:
    ~/.zpreztorc:
    ~/.streamlinkrc:
    ~/.wgetrc:
    ~/.vimrc:
    ~/.vodrc:
    ~/.gitconfig:
    /usr/local/bin/imgcat:
      path: bin/imgcat
    /usr/local/bin/+x:
      path: bin/+x
    /usr/local/bin/lc:
      path: bin/lc

- shell:
  - [chmod +x /usr/local/bin/imgcat, Setting permissions for imgcat.]
  - [chmod +x /usr/local/bin/+x, Setting permissions for +x.]
  - [chmod +x /usr/local/bin/lc, Setting permissions for lc.]
  - [vim +PluginInstall +qall, Installing Vim plugins.]
```

This file allow you to configure every steps of the process by defining how dotfiles should be set up, what shell commands should be run, etc.

You can find more informations on the [Dotbot repository](https://github.com/anishathalye/dotbot).

## `install` script

This script will launch the following scripts located in the `setup` folders:

- `xcode.sh`: Install the XCode Command Line Tools.
- `homebrew.sh`: Install [Homebrew](https://brew.sh/).
- `formulas.sh`: Install various Homebrew Formulas. This is the file to edit to define all the Formulas you want to install.
- `casks.sh`: Install [Homebrew-Cask](https://caskroom.github.io/) and various Casks. This is the file to edit to define all the Casks you want to install.
- `node.sh`: Install the latest stable version of [Node.js](https://nodejs.org) and install various global packages. This is the file to edit to define all the global packages you want to install.
- `settings.sh`: Configure all your environment settings. This is the file to edit to enable / disable some customizations and define your own.

## Resources

* [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles)
* [nicksp/dotfiles](https://github.com/nicksp/dotfiles)
* [necolas/dotfiles](https://github.com/necolas/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [alrra/dotfiles](https://github.com/alrra/dotfiles)
* [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
* [jacobwgillespie/dotfiles](https://github.com/jacobwgillespie/dotfiles)


## License

Code released under the [MIT license](https://github.com/HiDeoo/dotfiles/blob/master/LICENSE.md).
