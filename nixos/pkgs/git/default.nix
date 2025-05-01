{ config, opts, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = opts.username;
    userEmail = opts.usermail;

    aliases = {
      co = "checkout";
      br = "branch";
      cm = "commit";
      st = "status";
      rs = "reset";
    };

    extraConfig = {
      core.autocrlf = "input";
      color.ui = "auto";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      credential.helper = "store";
    };

    includes = [
      { 
        path = "~/CodeHub/.gitconfig";
        condition = "gitdir:~/CodeHub/";
      }
    ];
  };
}
