unset SSH_AGENT_PID

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null


# See too sessionVariable in home.nix
export EDITOR="nvim";
export VISUAL="nvim";

# Set the default browser
export BROWSER="google-chrome-stable";
export NIXPKGS_ALLOW_UNFREE="1";

# Few extra aliases
alias ll="ls -lh";
alias la="ls -a";
alias lla="ls -lah";
alias llt="ls -lhtr";
alias nd="nix develop"