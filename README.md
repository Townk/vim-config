# vim-config #

Welcome to my full vim configuration!

Before you clone this project I would like to take some time to explain you my
decisions here and to try to warn you of possible problems you might face.

## Plugin manager ##

After a lot of consideration and testing I decided to go with vimPlug for my
pluggint manager. The reason for that is vimPlug is somewhat betweein pathogen
and vundle which was exactly what I was looking for.

## Target audience ##

Anyone can use and modify my configurations in any way needed. I would only
suggest that you 1) give me credit for something interesting you find here and
2) share your changes so other could benefit from it.

That being said I would like to point out that I work as a software engineer so
most of my configurations are target for that kind of work.

## Installation ##

You can use this in any way you prefer but I would like to show you how I use
it in my machines.

1. Clone this project on any directory;
2. Initialize the submodules;
3. Link the `vimrc` and `gvimrc` files to your home directory with a `.`
   prepended;
4. Link the directory `vim` to your home directory with a `.` prepended;

Like this:

```sh
    $ mkdir -p ~/Projects/vim
    $ cd ~/Projects/vim
    $ git clone https://github.com/Townk/vim-config.git
    $ ln -sf ~/Projects/vim/vim-config/vimrc ~/.vimrc
    $ ln -sf ~/Projects/vim/vim-config/gvimrc ~/.gvimrc
    $ ln -sf ~/Projects/vim/vim-config/vim ~/.vim
```

**Note:** I only tested these configurations on Unix environments. You'll see
some Win32 checks here but I can't guarantee this will work perfectly on
Windows, so use at your own risk.

