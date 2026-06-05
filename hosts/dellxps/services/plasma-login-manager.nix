{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
    displayManager = {
      plasma-login-manager = {
        enable = true;
        # package = pkgs.kdePackages.plasma-login-manager;
        # settings = {};
      };
      # defaultSession = "plasma";
    };
  };

  # systemd.services.plasmalogin.serviceConfig.KeyringMode = "inherit";
  # security.pam.services.plasmalogin-autologin.rules.auth = {
  #   systemd_loadkey = {
  #     order = 0;
  #     control = "optional";
  #     modulePath = "${pkgs.systemd}/lib/security/pam_systemd_loadkey.so";
  #   };
  #   plasmalogin = {
  #     order = 1;
  #     control = "include";
  #     modulePath = "plasmalogin";
  #   };
  # };
}
