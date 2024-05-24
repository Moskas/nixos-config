{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage {
  pname = "ngrrram";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "wintermute-cell";
    repo = "ngrrram";
    rev = "ac122c36604c9da1b11cf1688c3a5c628e0720fa";
    hash = "sha256-Ne6YAtRU9R667XkLBLxe+0IyWTtsRzNe4ngJa8K1P7s=";
  };

  cargoHash = "sha256-CWk3ixajgDI1oOOZ4qBZw5jq1xlJtxa6sAQu+fyk4rI=";

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "ngrrram is a CLI tool to practice typing ngrams";
    longDescription = "A TUI tool to help you type faster and learn new layouts. Includes a free cat.";
    homepage = "https://github.com/Moskas/whdl";
    license = licenses.gpl3;
    mainProgram = "ngrrram";
    maintainers = with maintainers; [ Moskas ];
    platforms = platforms.unix;
  };
}
