# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

#PS1='\#:\w \$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

# MY SETTING
# Dir colors (barwin custom)
# http://www.mactips.org/archives/2005/08/02/color-your-os-x-command-prompt/ 
# http://www.macosxhints.com/article.php?story=20031025162727485 
export CLICOLOR=1
#export LSCOLORS=FxFxCxDxBxegedabagacad 
#LSCOLORS='di=35;4;5:fi=34;ln=36:x=31'
#export LSCOLORS=exfxcxdxbxexexabagacad
#LSCOLORS=':*.cpp=33';export LSCOLORS
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\e[1;34m\]\h\[\e[0;32m\]:\[\e[1;35m\]\W\[\e[1;36m\] @\[\e[1;90m\]line-\[\e[0;91m\]\#\[\e[1;5;90m\]_\[\e[0m\]\[\e[32m\]\$\[\e[0m\] '
export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'
alias quiet='export PS1="\h:\W @line-\# \$ "'
alias loud='export PS1="\[\e[1;34m\]\h\[\e[0;32m\]:\[\e[1;35m\]\W\[\e[1;36m\] @\[\e[1;90m\]line-\[\e[0;91m\]\#\[\e[1;5;90m\]_\[\e[0m\]\[\e[32m\]\$\[\e[0m\] "'
alias restart='exec bash -l'

#mysql path 2015/7/10 
export PATH="/usr/local/mysql/bin:$PATH"

#Variable
alias db="cd ~/Dropbox"
alias class="cd /Users/LinYuAn/Dropbox/College/Course"
alias now="cd /Users/LinYuAn/Dropbox/College/Course/2016_Fall"

#Weather
alias weather="curl wttr.in/95060?m" 
alias moon="curl wttr.in/Moon"

#Cool Stuff
alias hack="cmatrix"
alias say="fortune"
alias saybad="fortune -o"

#Ascii Art
alias art="echo 'curl http://artscene.textfiles.com/asciiart/???'"
alias art1='curl http://artscene.textfiles.com/asciiart/watch!me.nfo'
alias art2='curl http://artscene.textfiles.com/asciiart/fuckyou.txt'
alias art3='curl http://artscene.textfiles.com/asciiart/smile'
alias art4='curl http://artscene.textfiles.com/asciiart/tree.art'
alias art5='curl http://artscene.textfiles.com/asciiart/bassett.art'

#Aliases
alias la="ls -a"
alias ll="ls -l"
alias c="cd"
alias vi="vim"
alias svi="sudo vi"
alias grep="grep --color=auto"

#youtube-dl
alias youtube="youtube-dl"
alias youtubecixfk="youtube-dl -cixf 22/18/best -k"
alias youtubecifo="youtube-dl -cif mp4/bestvideo,m4a/bestaudio -o '%(title)s.%(ext)s'"
alias youtubemusic="youtube-dl -cif m4a/bestaudio -o '%(title)s.%(ext)s'"

#Git Alias
alias gst="git status"
alias gb="git branch"
alias glg="git log -p"
alias gdc="git diff --cached"
alias glol="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias glola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gls="git ls-files compactlog = log --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short"
alias gco="git checkout"
alias glgl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

#Welcome Words
now=$(date +"%m/%d/%Y %H:%M:%S")
echo "Welcome back, Master Ewing!!"
fortune
echo "   ______                       "
echo "   |                            "
echo "   |____          * .___   ___  "
echo "   |     \  /\  / | |   | |   | "
echo "   |_____ \/  \/  | |   | |___| "
echo "                              | "
echo "                           ___| "
echo "Current: $now"
