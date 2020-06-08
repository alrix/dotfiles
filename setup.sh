# Grab some details
if [ -f /etc/lsb_release ] ; then
    DISTRIBUTION=`cat /etc/lsb_release | grep DISTRIB_ID | cut -d"=" -f2`
fi

# Download bash git prompt
if [ ! -d ~/repos/github/magicmonty/bash-git-prompt ] ; then
   git clone https://github.com/magicmonty/bash-git-prompt.git ~/repos/github/magicmonty/bash-git-prompt
fi

# Install some utilities
if [ ${DISTRIBUTION} = "Ubuntu" ] ; then
    apt-get install -y vim awscli ranger
fi

