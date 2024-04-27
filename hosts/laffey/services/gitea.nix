{ ... }:

{
  services.forgejo = {
    enable = true;
    settings.server = {
      DOMAIN = "laffey.home";
      ROOT_URL = "http://laffey.home/git/";
    };
  };
}
