{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services = {
    gvfs.enable = true;		# Mount, trash and other functionalities for thunar
    tumbler.enable = true; 	# Thumbnail support for images for thunar
  };

  environment.systemPackages = with pkgs; [
    # additional thunar functionality
    ffmpegthumbnailer		# video thumbnails
    poppler 			# pdf thumbnails
  ];
}
