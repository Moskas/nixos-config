{ inputs, ... }: {
  home.file = { "./Pictures/Wallpapers/".source = inputs.wallpapers; };
}
