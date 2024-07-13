{ pkgs, config, ... }:

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
              rev = "02c05e4aeefcc93644ad068219862e0c94d87f31";
              hash = "sha256-xrCfsCa/6yuRZlGf1nIpkha12oKVBf+p5yDfuyf0cBU=";
            };
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
        };
      };
    };
  };
}
