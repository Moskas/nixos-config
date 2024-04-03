{ config, ... }:

{
  home.file.".stumpwm.d/colors.lisp".text = ''
    (defvar base0  "#${config.colorScheme.palette.base00}")
    (defvar base1  "#${config.colorScheme.palette.base01}")
    (defvar base2  "#${config.colorScheme.palette.base02}")
    (defvar base3  "#${config.colorScheme.palette.base03}")
    (defvar base4  "#${config.colorScheme.palette.base04}")
    (defvar base5  "#${config.colorScheme.palette.base05}")
    (defvar base6  "#${config.colorScheme.palette.base06}")
    (defvar base7  "#${config.colorScheme.palette.base07}")
    (defvar base8  "#${config.colorScheme.palette.base08}")
    (defvar base9  "#${config.colorScheme.palette.base09}")
    (defvar base10 "#${config.colorScheme.palette.base0A}")
    (defvar base11 "#${config.colorScheme.palette.base0B}")
    (defvar base12 "#${config.colorScheme.palette.base0C}")
    (defvar base13 "#${config.colorScheme.palette.base0D}")
    (defvar base14 "#${config.colorScheme.palette.base0E}")
    (defvar base15 "#${config.colorScheme.palette.base0F}")
  '';
}
