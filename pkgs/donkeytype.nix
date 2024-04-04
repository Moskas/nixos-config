{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  pname = "donkeytype";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "radlinskii";
    repo = "donkeytype";
    rev = "74693dd59858204d8c1513aac03601519ba4ee75";
    hash = "sha256-pzBF0XoB5uRitXNtREbBQIogGe8L38Ki4GFYz41wxeI=";
  };

  cargoHash = "sha256-r0Bvh7QocHKucilg5GRR/R4WwcmyKJB43RfdPdDcb5Y=";

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  meta = with lib; {
    description = "cli typing test";
    longDescription = "a very minimalistic cli typing test.";
    homepage = "https://github.com/Moskas/whdl";
    license = licenses.mit;
    mainProgram = "donkeytype";
    maintainers = with maintainers; [ Moskas ];
    platforms = platforms.unix;
  };
}
