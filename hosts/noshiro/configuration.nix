{ username, pkgs, ... }:
{

  programs.zsh.enable = true;
  users.users.${username} = {
    createHome = true;
    isNormalUser = true;
    initialPassword = "nix";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "storage"
      "networkmanager"
      "libvirtd"
      "i2c"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  system.stateVersion = "23.05"; # Did you read the comment?
}
