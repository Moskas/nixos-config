{ ... }:

{
  imports = [
    ./dashboard.nix
    ./gitea.nix
    ./grocy.nix
    ./jellyfin.nix
    ./nginx.nix
    ./ollama.nix

    ./grafana.nix
    ./prometheus.nix
    ./deluge.nix
    ./vaultwarden.nix
    ./atuin.nix
  ];
}
