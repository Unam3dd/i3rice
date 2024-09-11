# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

DEVICE_ID=$(xinput list | grep "Touch[pP]ad" | grep -Po "id=[0-9]?[0-9]" | tr -d 'id=')
PROP_ID=$(xinput list-props $DEVICE_ID | grep "Natural Scrolling" | grep -Po "[0-9]?[0-9]?[0-9]" | head -n1)

xinput set-prop $DEVICE_ID $PROP_ID 1

rm -rf ~/.cache
. "$HOME/.cargo/env"
