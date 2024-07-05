{ ... }:

{
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_port = 3030;
      };
    };
  };
}
