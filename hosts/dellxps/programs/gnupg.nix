{pkgs, ...}: {
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentryPackage = pkgs.pinentry-qt;
    enableSSHSupport = true;
  };
}
