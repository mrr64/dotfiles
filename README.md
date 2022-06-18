# dotfiles
A collection of configuration files for linux platforms

# Usage
On a new system, install `git` and `stow`
```
$ apt install git
$ apt install stow
```

Now run the dotfiles setup

```
$ cd ~
$ git clone https://github.com/mrr64/dotfiles.git
$ cd ~/dotfiles
$ ./setup.sh
```

# vim/nvim Setup
`vim/nvim` packages are maintained using the `minpac` plugin. There is no need to keep `vim` plugins in `dotfiles`, so the `.gitignore` file ignores the `.vim/pack/minpac` directory and all sub directories. The `minpac` plugin will be installed automatically by `vimrc` the first time `vim/nvim` is run. After that, issuing the `PackUpdate` command will re-install all the plugins in the `vimrc` file.
