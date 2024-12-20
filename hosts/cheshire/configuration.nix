# Edit this configuration file to define what should be installed oncheshire
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{
  pkgs,
  username,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/nix
    ../../modules/fonts
    ../../modules/scripts/diff.nix
    ../../modules/services/tailscale.nix
    ../../modules/services/fwupd.nix
    ../../modules/services/udev.nix
    ../../modules/services/btrfs.nix
    ../../modules/services/ssh.nix
    ../../modules/overlays
    ../../modules/nvidia/nvidia.nix
    ../../modules/desktops/theming/stylix.nix
    ../../modules/desktops/qtile.nix
    ../../modules/desktops/hyprland.nix
    ../../modules/desktops/niri.nix
    #../../modules/desktops/stumpwm.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        edk2-uefi-shell.enable = true;
        windows."11".efiDeviceHandle = "HD1b";
        configurationLimit = 20;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = false;
        devices = [ "/dev/disk/nvme0n1" ];
        useOSProber = true;
        efiSupport = true;
      };
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

  # Enable nvidia driver
  hardware = {
    cpu.amd.updateMicrocode = true;
    nvidia.open = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mangohud
        nvidia-vaapi-driver
        vaapiVdpau
      ];
      extraPackages32 = with pkgs; [ mangohud ];
    };
    nvidia-container-toolkit.enable = true;
    bluetooth = {
      enable = true;
    };
    steam-hardware.enable = true;
    opentabletdriver.enable = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
  };

  programs.gamescope = {
    enable = false;
    env = {
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
  };

  programs.nix-ld = {
    enable = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
    # Set the refresh rate for the monitor
    config = ''
      Section "Monitor"
        Identifier "DP-0"
        Option "PreferredMode" "1920x1080_143.98"
        Option "RefreshRate" "143.98"
      EndSection
    '';
  };
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
    touchpad = { };
  };

  networking = {
    hostName = "cheshire";
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
    firewall = {
      allowedTCPPorts = [
        22
        6600
        11111
        24070
      ];
      allowedUDPPorts = [
        22
        11111
        24070
      ];
      enable = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  #services.xserver.desktopManager.plasma6.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    displayManager.gdm.enable = true;
    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome-git;
      luaModules = with pkgs.luaPackages; [ luarocks ];
    };
    # Commands to run while launching the display manager
    displayManager.setupCommands = ''
      xrandr --output DP-0 --mode 1920x1080 --rate 143.98
    '';
    # Commands to run while launching graphical environment
    displayManager.sessionCommands = ''
      xrandr --output DP-0 --mode 1920x1080 --rate 143.98
    '';
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = (pkgs.ollama.override { acceleration = "cuda"; });
  };

  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 11111;
    openFirewall = true;
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
    jack.enable = true;
  };

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      tumbler
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  services.gvfs.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
    packages = with pkgs; [ libz ];
  };

  environment.variables = {
    EDITOR = "emacs";
    #DEFAULT_BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
    MANPAGER = "less -FR";
    #PAGER = "bat";
    PULSE_LATENCY_MSEC = "50";
    WEBKIT_DISABLE_DMABUF_RENDERER = "1"; # I had issues where nyxt would launch with blank window
    GOPATH = "$HOME/.local/share/go";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    i2c-tools
    openrgb-with-all-plugins
    #mpd
    #mpdas
    #dbus

    timeshift
    #scrcpy
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.dconf = {
    enable = true;
  };

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  nix.settings = inputs.aagl.nixConfig;
  programs.sleepy-launcher.enable = true;

  programs.virt-manager.enable = true;
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
