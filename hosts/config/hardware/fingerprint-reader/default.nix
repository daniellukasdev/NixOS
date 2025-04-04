{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Fingerprint Reader
    fprintd
    fprintd-tod
    libfprint
    libfprint-2-tod1-goodix
    #libfprint-2-tod1-goodix-550a
  ];

  services = {
    fprintd = {
      enable = true;
      package = pkgs.fprintd-tod;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
}
