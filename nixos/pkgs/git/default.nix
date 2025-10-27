{ opts, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing = {
      format = "openpgp";
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Neo";
        email = "wangyongzhao@avatolabs.com";
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
