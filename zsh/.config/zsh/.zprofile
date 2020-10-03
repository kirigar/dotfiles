# Set basic environment variables
export VISUAL="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/firefox"
export TERMINAL="/usr/bin/kitty"
export LAUNCHER="/usr/bin/rofi -show drun"
export MUSICPLAYER="/usr/bin/ncmpcpp"

# Cleanup home directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export LESSHISTFILE=-

export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint.d"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export STACK_ROOT="$XDG_DATA_HOME/stack"

# Add to path
export PATH="$HOME/.local/bin:$PATH"

# Configure and start Xorg if running on tty1 and bspwm not already running
if [[ "$(tty)" = /dev/tty1 && ! $(pgrep -x "bspwm" > /dev/null) ]]; then
	export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
	export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

	exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

# If not running Xorg load the keymap for the tty
# Sudo has been configured to allow this command without entering a password
sudo -n loadkeys "$XDG_CONFIG_HOME/tty_keymap"
