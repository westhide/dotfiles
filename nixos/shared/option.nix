{ ... }:

{
  system = "x86_64-linux";
  username = "westhide";
  usermail = "westhide.dev@gmail.com";
  hostname = "westhide-nixos";
  proxyurl = null;
  wkgitdir = "~/store/CodeHub";
  geoipupdate = {
    AccountID = 1173729;
    LicenseKey = "/etc/nixos/secrets/geoipupdate.key";
  };
}
