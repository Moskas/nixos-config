{
  disko.devices = {
    disk = {
      vda = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/rootfs" = { mountpoint = "/"; };
                  "/home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };
                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap = { swapfile.size = "8G"; };
                  };
                  "/media" = {
                    mountpoint = "/media";
                    mountOptions = [ "compress=zstd" ];
                  };
                };

                mountpoint = "/partition-root";
                swap = { swapfile = { size = "8G"; }; };
              };
            };
          };
        };
      };
    };
  };
}
