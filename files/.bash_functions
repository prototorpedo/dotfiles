function homestead() {
    ( cd ~/vagrant/homestead && vagrant $* )
}

function mkcd () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}

function git-history {
	(for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort)
}

function gsearchday () {
	if [ "$#" -eq "2" ]; then
		MM="$1"
		DD="$2"
	elif [ "$#" -eq "1" ]; then
		read MM <<<$(date +'%m')
		DD="$1"
	fi

	read YYYY <<<$(date +'%Y')

	git log --after="$YYYY-$MM-$DD 00:00" --before="$YYYY-$MM-$DD 23:59" --all --author="Bogdan Calin"
}

function zealstreamdl () {
    streamlink --http-header "referer"="https://player.zealstream.com/" --http-header "User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0" $1 best -o $2
}

function mp4tomp3 () {
    ffmpeg -i $1 -vn \
       -acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
        $1.mp3
}

function mp3slice () {
    ffmpeg -t $2 -i $1 -acodec copy "$1-sliced.mp3"
}

function renameall () {
    rename 's/^$1/$2/' $1*
}

function mkcd () {
    if [ ! -d $1 ] ; then mkdir $1
    cd $1
}
