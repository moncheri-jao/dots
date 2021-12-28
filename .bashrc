#
# ~/.bashrc
#
shopt -s extglob
export PATH=$PATH:~/bin
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#
PS1='[\u@\h \W]\$ '
#
# VTE_config
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
#
### a e s t h e t i c s
#
set -o vi
#screenfetch -w
#wal -r && clear
#wal.paper
neofetch --kernel_shorthand off --disk_percent on --memory_percent on --underline on --underline_char = --color_blocks on --ascii_bold on --ascii_distro blackarch --os_arch off --uptime_shorthand tiny
export bgpth=$(gsettings get org.gnome.desktop.background picture-uri)
#
#
alias ls='ls --color=auto'
#
# rice aliases
alias bashrc="nvim $HOME/.bashrc"
alias vimrc="nvim $HOME/.vimrc"
#
# command alias
alias nv="nvim"
alias za="zathura"
#
# folder alias
alias notes="cd $HOME/Dropbox/appunti/ && ls"
alias gdrive="cd $HOME/vGrive/ && ls"
alias nem="cd $HOME/Dropbox/appunti/electromagnetism/ && ls"
alias dbox="cd $HOME/Dropbox/ && ls"
alias books="cd $HOME/vGrive/Moe\'s_Folder/books/ && ls"
#
# cr-dcr (openssl)
alias cryp="openssl aes-256-cbc -in"
alias dcryp="openssl aes-256-cbc -d -in"
#
