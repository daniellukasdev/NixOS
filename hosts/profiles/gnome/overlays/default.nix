{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
        gnome-terminal = gnomePrev.gnome-terminal.overrideAttrs (old: {
          patches =
            (old.patches or [])
            ++ [
              ./transparency.patch
            ];
        });
        mutter = gnomePrev.mutter.overrideAttrs (old: {
          src = pkgs.fetchgit {
            url = "https://gitlab.gnome.org/vanvugt/mutter.git";
            # GNOME 45: triple-buffering-v4-45
            rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
            sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
          };
        });
      });
    })
  ];
}
