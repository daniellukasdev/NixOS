{
  pkgs,
  self,
  ...
}: let
  # hyprlandPackages = with pkgs; [
  #   anyrun
  #   hyprpicker
  #   nautilus
  #   code-nautilus
  #   nautilus-open-any-terminal
  #   nautilus-python
  #   nwg-look
  #   nwg-launchers
  #   nwg-dock-hyprland
  #   nwg-drawer
  # ];
  kdePackages = with pkgs.kdePackages; [
    # discover
    kate
    kruler
    # use digital clock with PIM plugin
    akonadi-calendar
    kdepim-addons
    merkuro
    # security stuff
    ksshaskpass
    qtstyleplugin-kvantum

    # plasma-theme-switcher
    yakuake
  ];
in {
  imports = [
    # ./blender.nix
    ./dev
  ];

  home.packages = with pkgs;
    [
      self.packages.${stdenv.hostPlatform.system}.lightctl
      self.packages.${stdenv.hostPlatform.system}.networkctl
      self.packages.${stdenv.hostPlatform.system}.volumectl

      _1password-cli
      _1password-gui
      act
      amberol
      bc
      beekeeper-studio
      brave
      celluloid
      cloudflared
      dbmate
      dconf2nix
      dconf-editor
      discord
      dust
      duf
      fd
      ffmpeg-full
      ffmpegthumbnailer
      file
      foliate
      gcc
      genact
      ghostscript
      gimp
      gnumake
      # gobang
      grim
      grimblast
      grex
      hoppscotch
      imagemagick
      imv
      inkscape
      jaq
      jq
      just
      killall
      krita
      lazydocker
      lefthook
      libnotify
      loupe
      nodejs
      obsidian
      openssl
      ouch
      p7zip
      pear-desktop
      pm2
      pnpm
      pocketbase
      podman-compose
      postman
      pre-commit
      prettierd
      procs
      psmisc
      psutils
      pwvucontrol
      redis
      ripgrep
      rsync
      scc
      sd
      slurp
      speedtest-cli
      # spotify
      swappy
      syncthing
      trash-cli
      tree
      typst
      unrar
      unzip
      upscayl
      watchexec
      wget
      wf-recorder
      # whitesur-gtk-theme
      wl-clipboard
      wrk
      xh
      yo
      yq
      yt-dlp
      zip
    ]
    # ++ hyprlandPackages
    ++ kdePackages;
}
