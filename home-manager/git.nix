{ config, lib, pkgs, ... }:
{

  programs.git = {
    enable = true;
    userName = lib.mkForce "Jean Ponchon";
    userEmail = lib.mkForce "jean.ponchon@novadiscovery.com";
    extraConfig = {
      core.editor = "${pkgs.neovim}/bin/nvim";
      init.defaultBranch = "main";
      pull.ff-only = true;
    };
    aliases = {
      amend = "commit --amend";
      amend-noedit = "commit --amend --no-edit";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      co = "checkout";
      cob = "checkout -b";
      cam = "commit -am";
      cm = "commit -m";
      diff-changes = "diff --name-status -r";
      diff-staged = "diff --cached";
      diff-stat = "diff --stat --ignore-space-change -r";
      diff-upstream = "!git fetch origin && git diff main origin/main";
      fixup = "!git log --oneline --decorate | fzf --color | awk '{ print $1 }' | xargs -I{} git commit --fixup={}";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      others = "ls-files --others --ignored --exclude-from=.gitignore";
      squash = "rebase --autosquash -i";
      rm-untracked = "clean -df";
      s = "status";
      search-files = "log --oneline --name-status --source --all -S";
      search-text = "!f() { git grep \"$*\" $(git rev-list --all); }; f";
      undo = "undo = reset HEAD~1 --mixed";

    };
  };
}
