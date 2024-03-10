{ pkgs, ... }:

pkgs.writeShellScriptBin "fullshot" ''
  ${pkgs.flameshot}/bin/flameshot full -c

  # Define the directory
  directory="/home/moskas/Pictures/Screenshots/"

  # Check if the directory exists
  if [ ! -d "$directory" ]; then
      echo "Directory not found: $directory"
      exit 1
  fi

  # Change to the directory
  cd "$directory" || exit

  # Get the newest file
  newest_file=$(ls -t | head -n 1)

  # Check if the file exists
  if [ ! -f "$newest_file" ]; then
      echo "No files found in directory: $directory"
      exit 1
  fi

  # Print the contents of the newest file
  ${pkgs.libnotify}/bin/notify-send "Screenshot taken" "$newest_file" -i "$directory$newest_file"
''
