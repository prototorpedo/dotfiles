### Git
alias ga="git add"
alias gam="git commit --ammend"
alias gamq="git add -A && git commit --amend --no-edit"
alias gc="git commit -m"
alias gcq="git add -A && git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gdl="git diff --cached HEAD^"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfp="git fetch --prune"
alias gl="git log"
alias gll="log --pretty --decorate --numstat"
alias gnah="git reset --hard && git clean -df"
alias gpl="git pull"
alias gplo="git pull origin develop --no-ff"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grst="git reset"
alias grsth="git reset --hard"
alias grsthc="grsth && git clean -fd"
alias gs="git status"
alias gss="git status -s | cat -n"
alias gst="git stash"
alias gsync="git fetch --prune && git rebase origin/develop"

### PHP
alias artisan="php artisan"

### Docker
alias dco="docker-compose"
alias dcoe="docker-compose exec"
alias de="docker exec -ti"
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"

### Others
unalias lt
# alias yt-dlp="python ~/.local/bin/yt-dlp"

alias autoclick="xdotool click --delay 10000 --repeat 200 1"

alias vpn-oltenitei="wg-quick up raspberry-vpn"
alias vpn-oltenitei_down="wg-quick down raspberry-vpn"

alias ssh-oltenitei="ssh prototorpedo-home.go.ro"

alias pkgsizes='dpkg-query --show --showformat="\${Package;-50}\t\${Installed-Size}\n" | sort -k 2 -n | grep -v deinstall'
