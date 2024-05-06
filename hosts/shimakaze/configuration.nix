{ pkgs, modulesPath, ... }:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    ../../modules/fonts # A little redundant on wsl but I couldn't find a way to use windows fonts in nixos-wsl
    ../../modules/services/ssh.nix
    ../../modules/scripts/diff.nix
    ../../modules/nix
    ../../modules/overlays
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    #automountPath = "/mnt";
    defaultUser = "moskas";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;
    wslConf.network.generateResolvConf = false;
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  users.users.moskas = {
    isNormalUser = true;
    description = "Moskas";
    extraGroups = [
      "wheel"
      "storage"
    ];
    shell = pkgs.zsh;
  };

  networking = {
    hostName = "shimakaze";
    nameservers = [ "1.1.1.1" ];
  };

  time.timeZone = "Europe/Warsaw";

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  programs.nix-ld = {
    enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wget
      git
      ripgrep
      direnv
      cmake
      pkg-config
    ];

    noXlibs = false;
    variables = {
      EDITOR = "nvim";
    };
  };

  system.stateVersion = "22.05";
}
