# CFG

## My Dot Files
This is a collection of dot (.) files for usage with applications such as:
- vim
- tmux
- zsh

## Instructions
The method to the madness is through employing [git bare repositories](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/). Generally, we create a bare repository in the user's home directory, we alias `git` to `config`, and we track only the files we care about using `config`
### Getting Started
__Be sure to move or rename .vimrc, .tmux.conf, and .zshrc out of the home directory before getting started__
```
cd $HOME
git clone --bare git://git.redbrickhealth.net/mburling/cfg .cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# the following line is only necessary if using a .bashrc/.zshrc other than the one
# provided here
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
__Remember__ Subsquent interaction with the configurations will be through `config` and not `git`
