{ ... }:

{
  services.easyeffects = {
    enable = true;
    preset = "Bass";
  };

  xdg.configFile."easyeffects/output/Bass.json" = {
    text = ''
      {
          "output": {
              "bass_enhancer#0": {
                  "amount": 0.0,
                  "blend": 0.0,
                  "bypass": false,
                  "floor": 20.0,
                  "floor-active": false,
                  "harmonics": 8.5,
                  "input-gain": 0.0,
                  "output-gain": 0.0,
                  "scope": 100.0
              },
              "bass_loudness#0": {
                  "bypass": false,
                  "input-gain": 0.0,
                  "link": -9.1,
                  "loudness": -3.1,
                  "output": -6.0,
                  "output-gain": 0.0
              },
              "blocklist": [],
              "compressor#0": {
                  "attack": 20.0,
                  "boost-amount": 6.0,
                  "boost-threshold": -72.0,
                  "bypass": false,
                  "dry": -100.0,
                  "hpf-frequency": 10.0,
                  "hpf-mode": "off",
                  "input-gain": 0.0,
                  "knee": -6.0,
                  "lpf-frequency": 20000.0,
                  "lpf-mode": "off",
                  "makeup": 0.0,
                  "mode": "Downward",
                  "output-gain": 0.0,
                  "ratio": 4.0,
                  "release": 100.0,
                  "release-threshold": -100.0,
                  "sidechain": {
                      "lookahead": 0.0,
                      "mode": "RMS",
                      "preamp": 0.0,
                      "reactivity": 10.0,
                      "source": "Middle",
                      "type": "Feed-forward"
                  },
                  "threshold": -12.0,
                  "wet": 0.0
              },
              "plugins_order": [
                  "bass_enhancer#0",
                  "bass_loudness#0",
                  "compressor#0"
              ]
          }
      }
    '';
  };
}
