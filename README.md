> [!NOTE]
>
> **System Information:**
>
> - **OS:** NixOS
> - **Window Manager:** Hyprland
> - **Shell:** ZSH
> - **Terminal:** Kitty
> - **Editor:** Visual Studio Code

## About

This is a set of configurations created for NixOS and Home Manager, utilizing the power of [flakes](https://nixos.wiki/wiki/Flakes) and [flake-parts](https://github.com/hercules-ci/flake-parts) for optimal organization and efficiency.

Theming uses colors taken from [Apple's official color guidelines](https://developer.apple.com/design/human-interface-guidelines/color).

## Installation

1. Download ISO

```shell
wget -O nixos.iso https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso
```

2. Write to a flash drive

```shell
cp nixos.iso /dev/sd<X>
```

3. Boot into the installer

4. Switch to root user

```shell
sudo -i
```

5. Partitionaling

- This NixOS configuration has Disko configured for disk partitioning and volume mounting.
- The host is configured for an NVME drive so you may need to update the device attribute in `./hosts/dellxps/disk-configuration.nix` to support your specific storage device.

```shell
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount <full-patch-to-this-repo>/NixOS/hosts/dellxps/disk-configuration.nix
```

- Create the `etc` directory in the mounted root partition at `/mnt`

```shell
mkdir /mnt/etc
```

6. Copy the repo to `/mnt/etc/nixos`

```shell
cp -rf /run/media/nixos/NIX-FILES/NixOS /mnt/etc/nixos
```

7. Enable Flakes

```shell
nix-shell -p nixFlakes
```

8. Install NixOS from flake

- I like to use the `--show-trace` flag but feel free to exclude it.

```shell
nixos-install --flake /mnt/etc/nixos#dellxps --show-trace
```

9. Set root passowrd and reboot into the new NixOS installation

## Post Installation

1. Set user password

```shell
passwd
```

### Optional

2. Setup GPG Key

```shell
gpg --import <path-to-private-key>/private.gpg
gpg --import <path-to-public-key>/public.gpg
```

3. Copy fingerprint to `/var/lib/fprint`.

4. Use token to connect to Github

## Nix Development

1. Use `nix-repl` to see any desired output of config. Type `.` after each section and hit tab to have repl show you all options.

```shell
$ nix repl

# repl start >>>>>>>
:lf . # or :load-flake .
outputs.nixosConfigurations.<host>.config.home-manager.users.<username>
# <<<<<<< repl end
```

2. Update configuration after making changes

```shell
sudo nixos-rebuild test --flake /etc/nixos#<config-hostname> --show-trace
sudo nixos-rebuild switch --flake /etc/nixos#<config-hostname> --show-trace
```

### Troubleshooting

1. Rebuild fails due to home-manager conflict

```shell
journalctl -xe --unit home-manager-<username>
```

## Credits

Based on the fantastic Yuki config by [Raexera](https://github.com/raexera).
