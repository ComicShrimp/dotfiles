# Cargo config

. "$HOME/.cargo/env"

# Add ~/bin to path if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
