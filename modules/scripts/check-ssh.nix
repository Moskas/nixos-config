{ pkgs, ... }:

pkgs.writeShellScriptBin "check-ssh" ''
  if [ -n "$SSH_CLIENT" ]; then
      hostname
  fi
''
