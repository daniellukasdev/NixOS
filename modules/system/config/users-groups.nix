{pkgs, ...}: {
  users.users.daniellukas = {
    isNormalUser = true;
    initialPassword = "NixOS";
    shell = pkgs.zsh;
    uid = 1000;

    extraGroups = [
      "adbusers"
      "audio"
      "docker"
      "input"
      "libvirtd"
      "networkmanager"
      "plugdev"
      "video"
      "wheel"
    ];

    # openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 <hash> <email>"
    # ];
  };
}
