{
  lib,
  pkgs,
  buildGoModule,
  ...
}:

buildGoModule {
  pname = "reader";
  version = "master";

  src = pkgs.fetchFromGitHub {
    owner = "mrusme";
    repo = "reader";
    rev = "dc68d3bad967f383a50989dcaf4a07b9ca614bd7";
    hash = "sha256-oZLQEzqyX4x4ou6GJqCR1D0kZnii9WFU47JOtiLPx+Y=";
  };

  vendorHash = "sha256-kqRoWl57C2Nwa5xJbC8RQqCHWZNppV6n3GMbRQDAYL8=";

  meta = with lib; {
    description = "reader is for your command line what the “readability” view is for modern browsers: A lightweight tool offering better readability of web pages on the CLI.";
    longDescription = ''reader is for your command line what the “readability” view is for modern browsers: A lightweight tool offering better readability of web pages on the CLI.'';
    license = licenses.gpl3Plus;
    maintainers = [ ];
    platforms = platforms.unix;
    mainProgram = "reader";
  };
}
