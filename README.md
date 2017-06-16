# CFG

## My Dot Files
This is a collection of dot (.) files for usage with applications such as:
- vim
- tmux
- ssh config

## Instructions

The method to the madness is through employing [git bare repositories](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/). Generally, we create a bare repository in the user's home directory, we alias `git` to `config`, and we track only the files we care about using `config`

### Getting Started
__Be sure to move or rename .vimrc, .tmux.conf, and ~/.ssh/config out of the home directory before getting started__
```
git clone --bare git://git.redbrickhealth.net/mburling/cfg $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no
# the following line is only necessary if using a .bashrc/.zshrc other than the one
# provided here
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
__Remember__ Subsquent interaction with the configurations will be through `config` and not `git`

#### Getting the Most from this Configuration

Multiplexing with this configuration will only work if you have all the correct keys in your local ~/.ssh directory:

* dev
* infra
* prod
* techops
* tools
