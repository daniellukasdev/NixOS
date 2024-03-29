{
  pkgs,
  ...
}: let
  devTools = with pkgs; [
    alejandra
    black
    bun
    ccls
    clang
    clang-tools
    cmake
    delve
    deno
    # go

    # gopls

    grex
    # java-language-server

    just
    lldb
    nodejs
    revive
    shellcheck
    shfmt
    typescript
    uncrustify
    zig
    zls
  ];
  guiPackages = with pkgs; [
    _1password-gui
    gimp
    # keepassxc

    tdesktop
    obsidian
  ];
  utilities = with pkgs; [
    atool
    bc
    catimg
    chafa
    coreutils
    curl
    du-dust
    duf
    editorconfig-core-c
    elinks
    exiftool
    fd
    file
    findutils
    gawk
    glow
    gnused
    hyperfine
    imagemagick
    jaq
    jq
    killall
    lz4
    neofetch
    nvd
    p7zip
    procs
    psmisc
    ripgrep
    rsync
    sd
    socat
    trash-cli
    ttyper
    unrar
    unzip
    util-linux
    wget
    xarchiver
    yt-dlp
    zathura
    zip
  ];
  nodePackages = with pkgs.nodePackages; [
    jsonlint
    pnpm
    typescript-language-server
    vls
    vscode-langservers-extracted
    yaml-language-server
    yarn
  ];
in {
  home.packages = with pkgs; [
    devTools
    guiPackages
    utilities
    nodePackages
    homePackages
  ];
}
