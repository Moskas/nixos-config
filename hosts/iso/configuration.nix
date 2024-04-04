{
  lib,
  pkgs,
  username,
  ...
}:

{
  imports = [ ../../modules/nix ];

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  networking.hostName = "iso";

  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "nix";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "storage"
      "networkmanager"
    ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    # FIXME after fixing nixvim
    #inputs.nixvim-config.packages.${system}.default
  ];

  programs.nano.enable = false;
}
