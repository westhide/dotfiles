{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = -1;
    historyFileSize = -1;
    historyControl = [
      "ignoredups"
    ];
    shellAliases = {
      ll = "ls -Alh --color=auto";
    };
  };
}
