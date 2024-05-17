{
  programs.starship = {
    enable = true;
    settings = {
      git_status = {
        conflicted = "😖 conflicted";
        ahead = "🚀⇡\${count}";
        behind = "🐢⇣\${count}";
        diverged = "😭⇅\${behind_count}\${ahead_count}";
        up_to_date = "[✔](green)";
        untracked = "🤷\${count}";
        stashed = "📦";
        modified = "[🌱+\${count}](green)";
        staged = "[💺+\${count}](blue)";
        renamed = "💱";
        deleted = "🚮";
        style = "bold purple";
      };
    };
  };
}