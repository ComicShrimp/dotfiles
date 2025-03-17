# Add ~/bin to path if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Add Flutter to path if it exists
if [ -d "$HOME/flutter" ] ; then
    export PATH=$HOME/flutter/bin:$PATH
fi
