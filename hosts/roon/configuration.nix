# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, username, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/fonts
    ../../modules/scripts/diff.nix
    ../../modules/nix
    ../../modules/services/tailscale.nix
    ../../modules/services/fwupd.nix
    ../../modules/overlays
  ];

  services.udev = {
    enable = true;
    packages = [ "/home/moskas/.config/60-openrgb.rules" ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Enabling latest xanmod linux kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  programs.nix-ld = { enable = true; };

  # Virtualisation and virt-manager
  virtualisation.libvirtd.enable = true;

  services.xserver = {
    videoDrivers = [ "nvidia" ];
    dpi = 100;
    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
      touchpad = { };
    };
  };
  hardware = {
    cpu.intel.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ mangohud nvidia-vaapi-driver ];
      extraPackages32 = with pkgs; [ mangohud ];
    };
    #fancontrol = { enable = true; };
    # For accessing the rgb
    i2c.enable = true;
    # Enable nvidia driver
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      package =
        config.boot.kernelPackages.nvidiaPackages.production; # Changed to stable due to issues with brightness control on beta
    };
    bluetooth = { enable = true; };
  };
  # For steam streaming
  hardware.steam-hardware.enable = true;

  # Cpu management
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpufreq.max = 2400000;
    cpuFreqGovernor = "powersave";
  };
  services.undervolt = {
    enable = true;
    coreOffset = -50;
  };
  networking.hostName = "roon";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 6600 ];
    allowedUDPPorts = [ ];
  };
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Graphical environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
  environment.gnome.excludePackages = (with pkgs; [ gnome-photos gnome-tour ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      gedit # text editor
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);
  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.awesome.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;
  #programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass"; # For plasma desktop
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      variant = "";
      layout = "pl";
    };
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  # services.printing.enable = false;

  # Enable TLP for laptop
  services.tlp.enable = true;

  # Enable sound.
  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      tumbler
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "Moskas";
    initialPassword = "nix";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "i2c" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ firefox ];
  };

  environment.variables = {
    EDITOR = "emacs";
    #DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
    #MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    #PAGER = "bat";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    PULSE_LATENCY_MSEC = "50";
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    ripgrep
    coreutils
    fd
    clang
    home-manager
    cmake
    gnumake
    openssl
    ninja
    gpp
    gcc
    iniparser
    cargo
    rustc
    rust-analyzer
    zathura
    kitty
    libtool
    xorg.xbacklight
    virt-manager
    alsaLib
    pkg-config
    udev
    vulkan-loader
    xorg.libX11
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXi
  ];

  #home-manager.users.moskas = with pkgs; {
  #  home.packages = [
  #      neofetch
  #  ];
  programs.zsh.enable = true;
  #};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; };
  programs.hyprland = { enable = false; };
  programs.dconf.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.ssh.startAgent = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
