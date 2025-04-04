{
  security = {
    pam = {
      services = {
        # Allow gnome-keyring to use fingerprint reader
        gnome-keyring = {
          enableGnomeKeyring = true;
          fprintAuth = true;
        };
        # Allow hyprlock to unlock the screen
        hyprlock = {};
        # Allow logging in with fingerprint reader
        login = {
          fprintAuth = true;
        };
      };
    };

    # Enable polkit
    polkit.enable = true;

    # Enable the RealtimeKit system service
    rtkit.enable = true;

    # Don't ask for password for wheel group
    sudo.wheelNeedsPassword = false;

    # Enable Trusted Platform Module 2 support
    tpm2.enable = true;
  };
}
