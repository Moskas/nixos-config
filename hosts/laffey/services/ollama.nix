{
  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    open-webui = {
      enable = true;
      port = 11111;
    };
  };
}
