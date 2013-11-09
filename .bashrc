#Path
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=/usr/local/mysql/bin:$PATH  # for Homebrew
export PATH=~/bin:$PATH

#Language setting
export LANG=ja_JP.UTF-8

# Application Shortcuts
alias cot='open -g -a CotEditor' # ターミナルからCotEditorを開く
alias coda='open -g -a Coda' # ターミナルからCodaを開く
alias safari='open -g -a safari' # ターミナルからSafariを開く
alias console='open -a console' # ターミナルからコンソールを開く

# for shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias ls='ls -GwF'
alias la='ls -alh'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
alias vi='vim'
alias v='vim'
alias sr='screen -d -R'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
