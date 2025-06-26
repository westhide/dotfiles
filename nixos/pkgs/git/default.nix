{ opts, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = opts.username;
    userEmail = opts.usermail;

    aliases = {
      cl = "clone";
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
        path = "${opts.wkgitdir}/.gitconfig";
        condition = "gitdir:${opts.wkgitdir}/**";
      }
    ];
  };
}
