# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./services
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  # Nix
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
  };

  networking.hostName = "laffey"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.moskas = {
    isNormalUser = true;
    description = "Moskas";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ ];
  };
  # Set default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    btop
    du-dust
    duf
    neofetch
    ffmpeg
    nixfmt
    rustup
    gcc
    gpp
    cmake
    coreutils
    emacs29
    kitty
    distrobox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  virtualisation.docker.enable = true;

  services.minecraft-server = {
    enable = false;
    eula = true;
    # jvmOpts =
    #  "-Xms4092M -Xmx4092M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10";
  };

  #services.emacs = {
  #  enable = true;
  #  package = pkgs.emacs;
  #};
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 6600 23 8080 3000 80 8096 25565 ];
    allowedUDPPorts = [ ];
  };

  # nginx

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."optiplex.home" = {
      locations."/git" = {
        proxyPass = "http://localhost:3000/"; # Proxy Gitea
      };
    };
  };

  # Jellyfin
  services.jellyfin.enable = true;

  # Gitea
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    appName = "My awesome Gitea server"; # Give the site a name
    settings = {
      database = { type = "postgres"; };
      server = {
        DOMAIN = "optiplex.home";
        ROOT_URL = "http://optiplex.home/";
        HTTP_PORT = 3000;
      };
    };
  };

  services.postgresql = {
    enable = true; # Ensure postgresql is enabled
    authentication = ''
      local gitea all ident map=gitea-users
    '';
    identMap = # Map the gitea user to postgresql
      ''
        gitea-users gitea gitea
      '';
  };

  services.nextcloud = {
    enable = false;
    hostName = "optiplex.home";
    config = {
      adminuser = "admin";
      adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
