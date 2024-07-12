{ ... }:

{
  imports = [
    ./brave.nix
    ./firefox.nix
    #./qutebrowser.nix # TODO reenable after https://github.com/NixOS/nixpkgs/pull/326607 gets merged
  ];
}
