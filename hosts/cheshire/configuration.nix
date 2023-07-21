# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, username, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  services.udev = {
    enable = true;
    packages = [ "/home/moskas/.config/60-openrgb.rules" ];
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      builders-use-substitutes = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Add support for Windows partitions
    supportedFilesystems = [ "ntfs" ];
  };


  # Enabling latest linux kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # Power management
  powerManagement = {
    enable = true;
    powertop.enable = false;
    cpuFreqGovernor = "ondemand";
  };
  #services.undervolt = {
  #  enable = true;
  #  coreOffset = -50;
  #};


  # Enable nvidia driver
  hardware = {
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ mangohud nvidia-vaapi-driver ];
      extraPackages32 = with pkgs; [ mangohud ];
    };
    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };
    steam-hardware.enable = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
    dpi = 100;
    resolutions = [{
      x = 1920;
      y = 1080;
    }];
    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
      touchpad = { };
    };
    xautolock = {
      enable = true;
      locker = "${pkgs.betterlockscreen}/bin/betterlockscreen -l";
      time = 15;
      enableNotifier = true;
      notifier = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds'";
    };
  };

  networking = {
    hostName = "cheshire"; # Define your hostname.
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
    firewall = {
      allowedTCPPorts = [ 22 6600 ];
      allowedUDPPorts = [ ];
      enable = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  services.xserver = {
    enable = true;
    layout = "pl";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = false;
    windowManager.qtile.enable = true;
  };
  # Enable sound.
  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    createHome = true;
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "storage" "networkmanager" "libvirtd" "i2c" "docker" ];
    packages = with pkgs; [
      firefox
      neovim
      discord
    ];
  };

  environment.variables = {
    EDITOR = "emacs";
    DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    neofetch
    i2c-tools
    openrgb-with-all-plugins
    mpd
    mpdas
    dbus
    direnv
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.dconf.enable = true;
  fonts.enableDefaultFonts = false;
  fonts.fonts = with pkgs; [
    nerdfonts
    noto-fonts-emoji
    ipafont
    kochi-substitute
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  systemd.user.services.mpdas = {
    #Unit = {
    description = "Audioscrobbler client for MPD";
    wantedBy = [ "multi-user.target" ];
    after = [ "default.target" ];
    #};
    serviceConfig = {
      ExecStart = "${pkgs.mpdas}/bin/mpdas";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
