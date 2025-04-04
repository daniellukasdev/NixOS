{
  users.users.daniellukas = {
    initialPassword = "NixOS";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "network"
      "networkmanager"
      "plugdev"
      "libvirtd"
      "mysql"
      "docker"
      "podman"
      "git"
    ];
  };
}
