# Grab some details
if [ -f /etc/lsb-release ] ; then
    DISTRIBUTION=`cat /etc/lsb-release | grep DISTRIB_ID | cut -d"=" -f2`
fi

# Update files
cp .vimrc ~/.vimrc

# Download bash git prompt
if [ ! -d ~/repos/github/magicmonty/bash-git-prompt ] ; then
   git clone https://github.com/magicmonty/bash-git-prompt.git ~/repos/github/magicmonty/bash-git-prompt
fi

# Update bashrc
cp ~/.bashrc ~/.bashrc.orig
sed -i '/# <<< alrix initialise <<</,/# >>> alrix initialise >>>/d' ~/.bashrc

cat .bashrc >> ~/.bashrc
