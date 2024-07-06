{ ... }:

{
  imports = [
    ./dashboard.nix
    ./gitea.nix
    ./grocy.nix
    ./jellyfin.nix
    ./nginx.nix

    ./grafana.nix
    ./prometheus.nix
    ./deluge.nix
    ./vaultwarden.nix
  ];
}
