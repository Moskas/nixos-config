{ ... }:

{
  services.deluge = {
    enable = true;
    declarative = false;
    config = {
      download_location = "/media/torrents";
      max_upload_speed = "1000.0";
      share_ratio_limit = "2.0";
      allow_remote = true;
      daemon_port = 58846;
      listen_ports = [
        6881
        6889
      ];
    };
    #authFile = "/home/moskas/deluge-auth";
    web = {
      enable = true;
      port = 8112;
      openFirewall = true;
    };
  };
}
