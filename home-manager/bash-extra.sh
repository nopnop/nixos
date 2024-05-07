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

# Store my history even if I crash or reboot (not sure if it may impact the performances)
# See https://blog.sanctum.geek.nz/better-bash-history/
PROMPT_COMMAND='history -a'

# Few extra aliases
alias ll="ls -lh";
alias la="ls -a";
alias lla="ls -lah";
alias llt="ls -lhtr";
alias nd="nix develop";
alias wifi="nmtui";
alias eslintfix="git show HEAD --format='' --name-status | grep -E '^[AM]' | grep -E '\.(vue|ts)$' | cut -f2 | xargs node_modules/.bin/eslint --fix";


# The fuck
eval "$(thefuck --alias)"

# Load the dev env variables from pass
loaddev() {
  export NPM_TOKEN=$(pass show nova/npm-token)
  export TIPTAP_PRO_TOKEN=$(pass show nova/tiptap-pro-token)
  export PATH="$HOME/mutable_node_modules/bin:$PATH" # Temporary fix for the breaking change introduced by pnpm v9 unavailable in nix
  export PATH="$HOME/.deno/bin:$PATH" # Temporary fix for the breaking change introduced by pnpm v9 unavailable in nix
}

# Force


nr() {
  nix run nixpkgs#$@
}

ns() {
  nix shell nixpkgs#$@
}