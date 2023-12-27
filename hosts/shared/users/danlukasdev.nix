{
  config,
  pkgs,
  ...
}:
 let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
    
    users.mutableUsers = false;
    users.users.danlukasdev = {
    description = "Daniel Lukas";
        initialPassword = "nixos";
        isNormalUser = true;
        uid = 1000;
        # shell = pkgs.zsh;
        extraGroups =
        [
            "wheel"
            "video"
            "audio"
            "input"
        ]
        ++ ifTheyExist [
            "network"
            "networkmanager"
            "wireshark"
            "mysql"
            "docker"
            "podman"
            "git"
            "libvirtd"
        ];

        packages = [pkgs.home-manager];
    };

  home-manager.users.danlukasdev = import ../../../home/danlukasdev/${config.networking.hostName};
}