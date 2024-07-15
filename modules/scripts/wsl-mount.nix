{ pkgs, ... }:

pkgs.writeShellScriptBin "wsl-mount" ''
  if [ -n "$1" ]; then
    # Convert the drive letter to lowercase
    drive_letter=$(echo "$1" | tr '[:upper:]' '[:lower:]')

    # Check if the mount point exists, if not create it
    if [ ! -d "/mnt/$drive_letter" ]; then
      sudo mkdir -p "/mnt/$drive_letter"
      echo "Created mount point: /mnt/$drive_letter"
    fi

    # Attempt to mount the drive
    if sudo mount -t drvfs "$drive_letter": "/mnt/$drive_letter"; then
      echo "Successfully mounted $drive_letter: to /mnt/$drive_letter"
      exit 0
    else
      echo "Failed to mount $drive_letter: to /mnt/$drive_letter"
      exit 127
    fi
  else
    echo "Usage: wsl-mount (drive letter)"
    exit 0
  fi
''
