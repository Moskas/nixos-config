{ ... }:

{
  services.grafana = {
    enable = false;
    settings = {
      server = {
        http_port = 3030;
      };
    };
  };
}
