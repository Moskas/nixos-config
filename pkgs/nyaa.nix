{
  lib,
  fetchFromGitHub,
  rustPlatform,
  cmake,
  pkg-config,
  openssl,
}:
rustPlatform.buildRustPackage {
  pname = "nyaa";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "Beastwick18";
    repo = "nyaa";
    rev = "e977a9f8616bef4b507f96107e2a0ec31d314f9b";
    hash = "sha256-SVL81RSrc3HGVkSghlQUvZzqZctfwWFSENkPWCo6upA=";
  };

  cargoHash = "sha256-pt+JlefWHnSBwShL8MOGP6LrZkkOUOKVR43bTMyAfaY=";

  nativeBuildInputs = [
    cmake
    pkg-config
    openssl
  ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "A nyaa.si tui tool for browsing and downloading torrents";
    longDescription = ''
      A simple TUI for browsing and downloading anime torrents from nyaa.si.
    '';
    homepage = "https://github.com/Beastwick18/nyaa";
    license = licenses.gpl3;
    mainProgram = "nyaa";
    maintainers = with maintainers; [ Moskas ];
    platforms = platforms.unix;
  };
}
