# <<< alrix initialise <<<
# Setup Terminal
PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'

# Setup Bash Prompt
if [ -f ~/repos/github/magicmonty/bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_END="\n\h:\W \u\$ "
    # GIT_PROMPT_ONLY_IN_REPO=1
    source ~/repos/github/magicmonty/bash-git-prompt/gitprompt.sh
fi

# Setup SSH Agent
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

# Update PATH
export PATH=~/bin:$PATH
# >>> alrix initialise >>>
