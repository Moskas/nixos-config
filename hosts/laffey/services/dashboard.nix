{
  services.homepage-dashboard = {
    enable = true;
    settings = { };
    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
    services = [
      {
        "Media" = [
          {
            "Jellyfin" = {
              description = "Jellyfin server";
              href = "http://laffey.home/jelly/";
            };
          }
        ];
      }
      {
        "Dev" = [
          {
            "Forgejo" = {
              description = "Local git";
              href = "http://laffey.home/git/";
            };
          }
        ];
      }
    ];
    bookmarks = [
      {
        Developer = [
          {
            Github = [
              {
                abbr = "GH";
                href = "https://github.com/";
              }
            ];
          }
        ];
      }
      {
        Entertainment = [
          {
            YouTube = [
              {
                abbr = "YT";
                href = "https://youtube.com/";
              }
            ];
          }
        ];
      }
    ];
  };
}
