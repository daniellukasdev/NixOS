{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./variables.nix
  ];

  environment = with pkgs; {
    binsh = lib.getExe bash;
    shells = [zsh];
    pathsToLink = ["/share/zsh"];

    # loginShellInit = ''
    #   eval $(gnome-keyring-daemon --start --daemonize --components=pkcs11,secrets,ssh)
    # '';
    # dbus-update-activation-environment --all
    # eval $(ssh-agent)

  };
}