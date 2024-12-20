{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "Iosevka"
          "JetBrainsMono"
          "Terminus"
        ];
      })
      noto-fonts-emoji
      ipafont # Japanese
      kochi-substitute # Japanese
      baekmuk-ttf # Korean
    ];
  };
}
