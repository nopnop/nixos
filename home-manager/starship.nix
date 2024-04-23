{
  programs.starship = {
    enable = true;
    settings = {
      git_status = {
        conflicted = "🏳";
        ahead = "🚀\${count}";
        behind = "😰 ⇣\${behind_count}";
        diverged = "😵 ⇡\${ahead_count}⇣\${behind_count}";
        up_to_date = "✓";
        untracked = "🤷";
        stashed = "📦";
        modified = "📝";
        staged = "[ ++\${count} ] (green)";
        renamed = "👅";
        deleted = "🗑";

      };
    };
  };
}