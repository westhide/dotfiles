{ pkgs, opts, ... }:

{
  home.packages = with pkgs; [
    github-cli
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = "ghost";
        email = "unknown@unknown.com";
      };
      alias = {
        cl = "clone";
        co = "checkout";
        br = "branch";
        cm = "commit";
        st = "status";
        rs = "reset";
      };
      core.autocrlf = "input";
      color.ui = "auto";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      credential.helper = "store";
      gpg = {
        format = "ssh";
      };
    };

    includes = [
      {
        path = "${opts.wkgitdir}/.gitconfig";
        condition = "gitdir:${opts.wkgitdir}/**";
      }
    ];
  };
}
