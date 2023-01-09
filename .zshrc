# --- {{{
# vim:ft=bash:fdm=marker
# --- }}}
#      ______  ______   ___   ___   ______    ______      
#     /_____/\/_____/\ /__/\ /__/\ /_____/\  /_____/\     
#     \:::__\/\::::_\/_\::\ \\  \ \\:::_ \ \ \:::__\/     
# ___    /: /  \:\/___/\\::\/_\ .\ \\:(_) ) )_\:\ \  __   
#/__/\  /::/___ \_::._\:\\:: ___::\ \\: __ `\ \\:\ \/_/\  
#\::\ \/_:/____/\ /____\:\\: \ \\::\ \\ \ `\ \ \\:\_\ \ \ 
# \:_\/\_______\/ \_____\/ \__\/ \::\/ \_\/ \_\/ \_____\/ 
#========================================================
# --- PATH EXPORT --- {{{
export PATH="${PATH}:$HOME/.local/bin:/usr/local/bin:$HOME/.local/bin/scripts"
export ZSH="/home/birrabenzina/.oh-my-zsh"
export XDG_RUNTIME_DIR="/home/birrabenzina"
# --- }}}

# --- TILIX VTE SOURCE --- {{{
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
# --- }}}

# --- ZSH-CONFIG --- {{{
# set zsh theme
ZSH_THEME="drunkfox"
# restore pywal colorscheme
#cat $HOME/.cache/wal/sequences
wal.paper -r
# oh-my-zsh loadup
plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
zstyle ':omz:update' mode auto #(disabled/reminder)
# neofetch startup
neofetch --kernel_shorthand off --disk_percent on --memory_percent on --underline on --undeline_char = --ascii_bold on --os_arch off --uptime_shorthand tiny --package_managers tiny
## -- EDITOR -- {{{
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR=vim
fi
# -- }}}
# vim keys
set -o vi
# --- }}}

# --- ALIASES --- {{{
# -- FOLDERS -- {{{
alias notes="cd ~/Dropbox/notes/ && ls"
alias nt="cd ~/Dropbox/spicyphysics/sources && ls"
alias emf="cd ~/Dropbox/spicyphysics/sources/electromagnetism && ls"
alias drop="cd ~/Dropbox/ && ls"
alias i3f="cd ~/.config/i3 && ls"
alias books="cd ~/books && ls"
alias cmds="cd ~/.local/bin/sys && ls"
# -- }}}
# -- RICES -- {{{
alias zshrc="$EDITOR ~/.zshrc"
alias i3rc="$EDITOR ~/.config/i3/config"
alias vimrc="$EDITOR ~/.vimrc"
alias texrc="$EDITOR ~/.vim/plugged/vim-latex/ftplugin/latex-suite/texrc"
alias statusrc="$EDITOR ~/.config/i3status/config"
alias picomrc="$EDITOR ~/.config/picom/picom.conf"
alias tilixrc="tilix --preferences"
alias krc="ibus-setup"
# -- }}}
# -- COMMANDS -- {{{
alias nv="nvim"
alias snv="sudo nvim"
alias v="vim"
alias sv="sudo vim"
alias za="zathura"
alias pacclean='(set -x; sudo pacman -Rs $(pacman -Qdtq))'
alias clean-aur='(set -x; yay -Rs $(yay -Qdtq))'
alias pubip="wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\<     -f 1"
alias :q="exit"
alias sysupd="yes | sudo pacman -Syu"
alias totupd="yes | paru -Syu --skipreview && date"
alias stfu="shutdown now"
alias powersave="sudo cpupower frequency-set -g powersave"
alias performance="sudo cpupower frequency-set -g performance"
alias schedutil="sudo cpupower frequency-set -g schedutil"
alias clean="clear && neofetch"
alias wre="nmcli d w re"
alias hotspot="nmcli d w r && sleep 3 && nmcli d w con Jazz_Band_Leningrad"
# -- }}}
# -- FILE SHORTCUTS -- {{{
alias nem="nvim ~/Dropbox/spicyphysics/sources/electromagnetism/electromagnetism.tex"
alias nqm="cd ~/Dropbox/spicyphysics/sources/quantum && nvim qm.tex"
alias bib="cd ~/Dropbox/appunti/bibliografia/bib.bib"
# -- }}}
# --- }}}
