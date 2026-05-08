{ opts, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing = {
      key = "~/.ssh/h3clabs/id_ed25519";
      format = "openpgp";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "h3clabs";
        email = "h3clabs@outlook.com";
      };
      aliases = {
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
