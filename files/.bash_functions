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