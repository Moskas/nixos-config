{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (tickrs.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [ ./tickrs-vim.patch ];
    }))
  ];

  xdg.configFile."tickrs/config.yml".source = (pkgs.formats.yaml { }).generate "config" {
    symbols = [
      "XMR-USD"
      "BTC-USD"
      "ETH-USD"
      "ADA-USD"
      "VRSC-USD"
      "BAT-USD"
      "RTM-USD"
      "DOGE-USD"
      "AMD"
      "NVDA"
      "INTC"
    ];
    time_frame = "1W";
    show_volumes = true;
    summary = true;
    chart_type = "candle";
  };
}
