{
  lib,
  python311Packages,
  fetchFromGitHub,
  pkgs,
}:

python311Packages.buildPythonApplication rec {
  pname = "epy";
  version = "v2023.6.11";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "wustho";
    repo = "epy";
    rev = "6b0e9fe0773f05fdf844b574f0f28df3961f60ab";
    hash = "sha256-nUccxSg2sp4FVReQhfx/R8EC9KuzoBuH8JsWKwrGiSQ=";
  };

  nativeBuildInputs = [ pkgs.python311Packages.poetry-core ];

  meta = with lib; {
    description = "CLI Epub Reader";
    homepage = "https://github.com/wustho/epy";
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
