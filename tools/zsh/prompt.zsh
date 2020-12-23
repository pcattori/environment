if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # show host (%m) for ssh sessions
    PROMPT="ssh@%m ❯ "
else
    PROMPT="❯ "
fi
