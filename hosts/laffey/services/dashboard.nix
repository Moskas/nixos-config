{
  services.homepage-dashboard = {
    enable = true;
    settings = { };
    services = [
      {
        "Media" = [
          {
            "Jellyfin" = {
              description = "Jellyfin server";
              href = "http://laffey.home:8096/";
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
