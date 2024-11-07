{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "laffey.home" = {
        locations = {
          "/" = {
            root = pkgs.fetchFromGitHub {
              owner = "Moskas";
              repo = "moskas.github.io";

              rev = "afee264507fe94fb32055314c1bbd1785e926f9d";
              hash = "sha256-CK3V7sUjuiPUfo20WmbvSOxJjx8d0L0AO2nx5N8A+0U=";
            };
          };
          "/dashboard/" = {
            proxyPass = "http://127.0.0.1:8082/";
            proxyWebsockets = true;
          };
          "/git/" = {
            proxyPass = "http://127.0.0.1:3000/";
            proxyWebsockets = true;
          };
          "/jelly/" = {
            proxyPass = "http://127.0.0.1:8096/";
            proxyWebsockets = true;
          };
          "/deluge/" = {
            proxyPass = "http://127.0.0.1:8112/";
            proxyWebsockets = true;
            extraConfig = ''
              proxy_set_header X-Deluge-Base "/deluge/";
              add_header X-Frame-Options SAMEORIGIN;
            '';
          };
          "/prometheus/" = {
            proxyPass = "http://127.0.0.1:9090/";
            proxyWebsockets = true;
            extraConfig = ''
              rewrite /prometheus/(.*) /$1  break;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            '';
          };
          "/atuin/" = {
            proxyPass = "http://127.0.0.1:8888/";
          };
          "/blog/" = {
            proxyPass = "http://127.0.0.1:5173/";
            proxyWebsockets = true;
          };
        };
      };
    };
  };
}
