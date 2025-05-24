{ ... }:

{
  system = "x86_64-linux";
  username = "westhide";
  usermail = "westhide.dev@gmail.com";
  hostname = "westhide-nixos";
  hardware = "lenovo-legion-15ich1650ti";
  proxyurl = null;
  wkgitdir = "~/Store/CodeHub";
  geoipupdate = {
    AccountID = 1173729;
    LicenseKey = "/etc/nixos/secrets/geoipupdate.key";
  };
}
