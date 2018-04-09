# helper file used add help tools

load_files() {
	declare -a local arr=("$@")
	for file in "${arr[@]}"; do
	    [[ -f "${file}" ]] && source "${file}"
	done
	unset file
}

load_files "${HOME}/.aliases.sh"

kill_process_by_name() {
    declare locale process_name=$1
    kill -9 $(ps aux | ag ${process_name} | awk '!/ag/ {print $2}')
}
