{
  config,
  pkgs,
  ...
}: {
  programs = {
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      settings = {
        use-agent = true;
        default-key = "A69A110979DF4E36";
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      # pinentryPackage = pkgs.pinentry-gnome3;
      enableSshSupport = true;
      enableZshIntegration = true;
    };
  };
}
