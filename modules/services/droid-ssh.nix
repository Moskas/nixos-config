{ config, pkgs, ... }:

let
  sshdDirectory = "${config.user.home}/.ssh";
  port = 8022;
in
{
  environment.packages = [
    (pkgs.writeScriptBin "sshd-start" ''
      #!${pkgs.runtimeShell}

      echo "Starting sshd in non-daemonized way on port ${toString port}"
      ${pkgs.openssh}/bin/sshd -f "${sshdDirectory}/sshd_config"
    '')
  ];
}
