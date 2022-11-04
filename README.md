<div align="center">
  <h1>dotfiles ⚙️</h1>
  <p>Dotfiles collection to install & configure HiDeoo's macOS setup</p>
</div>

<div align="center">
  <a href="https://github.com/HiDeoo/dotfiles/blob/main/LICENSE">
    <img alt="License" src="https://badgen.net/github/license/HiDeoo/dotfiles" />
  </a>
  <br />
</div>

> **Note**
>
> This repository should be forked and customized to fit your needs in order to include your own dotfiles. Make sure to add your existing dotfiles to your forked repository before using the `configure` script as it will erase the current ones.

## Features

### Installation

A script meant to be used after a fresh install of macOS that will automatically install all applications from Visual Studio Code to `jq` and configure the environment settings.

```shell
$ ./install
```

The installation process will:

- Install the [XCode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_).
- Install [Homebrew](https://brew.sh/).
- Install various [Homebrew Formulas](src/install/formulas.sh).
- Install various [Homebrew Casks](src/install/casks.sh).
- Configure all the [environment settings](src/install/settings.sh).

### Configuration

A script will use [Dotbot](https://github.com/anishathalye/dotbot) to install [Prezto](https://github.com/sorin-ionescu/prezto) if necessary, automatically symlink all dotfiles included in this repository to their assumed locations and install some useful scripts on the system.

```shell
$ ./configure
```

Dotfiles:

- [Borg](https://borgbackup.readthedocs.io/)
- [Git](https://git-scm.com/docs/git-config)
- [iTerm2](https://iterm2.com/documentation-preferences.html)
- [Neovim](https://neovim.io/doc/user/starting.html#init.lua)
- [Packer](https://github.com/wbthomason/packer.nvim)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Streamlink](https://streamlink.github.io/cli/config.html)
- [Wget](https://www.gnu.org/software/wget/manual/html_node/Wgetrc-Commands.html)
- [Zsh](http://zsh.sourceforge.net/Intro/intro_3.html#SEC3)

Scripts:

- `+x`: Script to quickly add the execution permission to a file.
- `backup`: Script using [Borg](https://borgbackup.readthedocs.io/) to create deduplicating backups every night.
- `brew_init`: Script to initialize [Homebrew](https://brew.sh/) with Apple Silicon support.
- `imgcat`: Script showing inline images in iTerm2.
- `mit`: Script to generate an MIT license file in the current directory.

## Resources

- [alrra/dotfiles](https://github.com/alrra/dotfiles)
- [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles)
- [jacobwgillespie/dotfiles](https://github.com/jacobwgillespie/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [necolas/dotfiles](https://github.com/necolas/dotfiles)
- [nicksp/dotfiles](https://github.com/nicksp/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)

## License

Licensed under the MIT License, Copyright © HiDeoo.

See [LICENSE](https://github.com/HiDeoo/dotfiles/blob/main/LICENSE) for more information.
