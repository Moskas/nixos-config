{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nix
  ];

  nixpkgs.hostPlatform.system = "i686-linux";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # auto-optimise-store = true;
    builders-use-substitutes = true;
    trusted-users = [ "root" "moskas" "@wheel" ];
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # (for BIOS systems only)
  # boot.loader.systemd-boot.enable = true; # (for UEFI systems only)

  time.timeZone = "Europe/Warsaw";

  # services.xserver = {
  #       enable = true;
  # };

  programs.zsh.enable = true;

  users.users.moskas = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ ];
    initialPassword = "nix";
  };

  networking = {
    hostName = "glasgow";
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    nixfmt
    neofetch
    btop
    du-dust
    duf
  ];

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  system.stateVersion = "23.11";
}
