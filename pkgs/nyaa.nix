{ lib, fetchFromGitHub, rustPlatform, cmake, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "nyaa";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "Beastwick18";
    repo = "nyaa";
    rev = "708779b78383e170ac50eee12416589fc83279a1";
    hash = "sha256-spQ0Zc1o/omA14CA7IsHrD6U/nRVYrDKQJj2DX6ZdMQ=";
  };

  cargoHash = "sha256-2BSXjMIhgmaooEuckQ/3ud8pea+00fHspUGUeCZcaKk=";

  nativeBuildInputs = [ cmake pkg-config openssl ];
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
