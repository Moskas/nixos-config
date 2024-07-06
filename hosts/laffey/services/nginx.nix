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
              rev = "25f2d153fddbebfc2fb4a9ecb9ef9d70efcbe1a3";
              hash = "sha256-2z9VmFQzFfxYQ6ll5/4Ggb+MWk9H/8CuXwkz5ZUl1I0=";
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
        };
      };
    };
  };
}
