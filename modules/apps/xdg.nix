let
  fileManager = "thunar.desktop";
  imageViewer = "nsxiv.desktop";
  mediaPlayer = "mpv.desktop";
  webBrowser = "firefox.desktop";
  docOpener = "org.pwmt.zathura-pdf-mupdf.desktop";
  textEditor = "emacsclient.desktop";
in
{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ fileManager ];
        "application/pdf" = [ docOpener ];

        "text/html" = [ webBrowser ];
        "x-scheme-handler/http" = webBrowser;
        "x-scheme-handler/https" = webBrowser;
        "application/xhtml+xml" = webBrowser;

        "image/jpeg" = imageViewer;
        "image/avif" = imageViewer;
        "image/gif" = imageViewer;
        "image/jpg" = imageViewer;
        "image/pjpeg" = imageViewer;
        "image/png" = imageViewer;
        "image/tiff" = imageViewer;
        "image/webp" = imageViewer;
        "image/x-bmp" = imageViewer;
        "image/x-gray" = imageViewer;
        "image/x-icb" = imageViewer;
        "image/x-ico" = imageViewer;
        "image/x-png" = imageViewer;

        "video/webm" = mediaPlayer;
        "video/mp4" = mediaPlayer;
        "video/mkv" = mediaPlayer;

        "text/markdown" = textEditor;
        "text/org" = textEditor;
      };
    };
  };
}
