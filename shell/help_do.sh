# helper file used add help tools

load_files() {
	declare -a local arr=("$@")
	for file in "${arr}"; do
		[[ -f "${file}" ]] && source "${file}"
	done
	unset file
}

load_files "${HOME}/.aliases.sh"