#!/usr/bin/env bash

###############################################################################
# setup.sh
# setup our dotfiles
###############################################################################

# make sure we have pulled in and updated any submodules

#git submodule init
#git submodule update

# directories that should be installed by all users including the root user
base=(
	bash
	bin
	tmux
	nvim
	vim
)

# directories that should, or only need to be installed for a local user
useronly=(
	git
)

# run the stow command for the passed in directory ($2) in location ($1)

stowit() {
	usr=$1
	app=$2
	# -v verbose
	# -R restow (will unstow and then restow)
	# -t target
	# --dotfiles - SUPPOSED to rename dot-* files AND drectories,but current
	# version does not work with directores...ver 2.4 should fix this but
	# so far its not available for debian (5/8/24) for now, this only affects
	# one directory-- ~/.config so this must still use the dot for now.

	stow --dotfiles -R -t ${usr} ${app}

}

echo ""
echo "Installing apps for user: ${whoami}"

# install root and local user apps
for app in ${base[@]}; do
	echo ${app}
	stowit "${HOME}" ${app}
done

# install local user only apps
for app in ${useronly[@]}; do
	if [[ ! $(id -u) == 0 ]]; then
		echo ${app}
		stowit "${HOME}" ${app}
	fi
done

echo ""
echo "DONE"
