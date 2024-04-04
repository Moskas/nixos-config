{
  lib,
  fetchFromGitHub,
  rustPlatform,
  cmake,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage rec {
  pname = "whdl";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "Moskas";
    repo = "whdl";
    rev = "e23f3ef0e52c144039e669726835a43507e8b2cf";
    hash = "sha256-snV/jTn6YagfYH+u7YJB0R5tUQWg5D5UQQPZtjzbQR8=";
  };

  cargoHash = "sha256-K/buXR7JjMC+XHV5K9ikMz8H8RhK6OQ/hF8iNI8BhMI=";

  nativeBuildInputs = [
    cmake
    pkg-config
    openssl
  ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "wallhaven.cc batch downloader written in Rust";
    longDescription = ''
      Simple wallhaven.cc wallpaper downloader written in Rust.
    '';
    homepage = "https://github.com/Moskas/whdl";
    license = licenses.mit;
    mainProgram = "whdl";
    maintainers = with maintainers; [ Moskas ];
    platforms = platforms.unix;
  };
}
