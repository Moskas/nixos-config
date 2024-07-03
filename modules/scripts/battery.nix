{ pkgs, ... }:

pkgs.writeShellScriptBin "bat-stat" ''
  # Find the first battery directory
  battery_dir=$(ls /sys/class/power_supply/ | grep "BAT*" | head -n 1 | awk '{print $1}')

  if [ -n "$battery_dir" ]; then
    # Get battery capacity
    capacity=$(cat "/sys/class/power_supply/$battery_dir/capacity")

    # Get battery status
    status=$(cat "/sys/class/power_supply/$battery_dir/status")

    # Determine symbol based on status
    case "$status" in
      "Charging")
        symbol="󱟠"
        ;;
      "Discharging")
        symbol="󱟞"
        ;;
      "Full")
        symbol="󰁹"
        ;;
      "Unknown")
        symbol="󰂑"
        ;;
      "Not charging")
        symbol="󱟢"
        ;;
      *)
        symbol="󰂑"
        ;;
    esac

    # Print battery capacity and status
    echo " $symbol $capacity% "
  fi
''
