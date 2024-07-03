{ username, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      LoginGraceTime = 0;
    };
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcyn8bcHt95Md8h93x630f2gfsTqaiwHXDyvu+iyuKW moskas@cheshire"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMpoSvwjWLgKtwr9e/VEsh2fNw39aEsSdSUdqxCEqFYQ moskas@roon"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy1Caq1FTROSBneua7vxvdi60ap3P9v4ZzgGSgtCdDM nix-on-droid@boise"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOqhJIblbfCgvzBAetg9qzlHyL19hiqMdKwPnc9MJIuM moskas@shimakaze"
  ];
}
