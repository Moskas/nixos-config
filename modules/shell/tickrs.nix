{ pkgs, ... }:

{
  home.packages = with pkgs; [ tickrs ];

  xdg.configFile."tickrs/config.yml".source =
    (pkgs.formats.yaml { }).generate "config" {
      symbols = [ "XMR-USD" "BTC-USD" "ETH-USD" "AMD" "NVDA" "INTC" ];
      time_frame = "1W";
      show_volumes = true;
      summary = true;
      chart_type = "candle";
    };
}
