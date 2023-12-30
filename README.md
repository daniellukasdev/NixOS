# NixOS

WIP of my NixOS journey.

Installation

1. Download ISO
    - Grab nixos-unstable
        - `wget -O nixos.iso https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso`

    - Write it to a flash drive
        - `cp nixos.iso /dev/sdX	`
2. Boot into the installer
3. Switch to root user 
    - `sudo -i`
4. Partitioning
- We create a 512MB EFI boot partition (/dev/nvme0n1p1) and the rest will be our LUKS encrypted physical volume for LVM (/dev/nvme0n1p2).
    - `gdisk /dev/nvme0n1`
        - `o` (create new empty partition table)
        - `n` (add partition, +512M, type ef00 EFI)
        - `n` (add partition, remaining space, type 8e00 Linux LVM)
        - `w` (write partition table and exit)

- Setup the encrypted LUKS partition and open it:
	- `cryptsetup luksFormat /dev/nvme0n1p2`
	- `cryptsetup config /dev/nvme0n1p2 --label cryptroot`
	- `cryptsetup luksOpen /dev/nvme0n1p2 enc`
- We create two logical volumes, a 24GB swap parition and the rest will be our root filesystem:
	- `pvcreate /dev/mapper/enc`
	- `vgcreate vg /dev/mapper/enc`
	- `lvcreate -L 32G -n swap vg`
	- `lvcreate -l '100%FREE' -n root vg`
- Format partitions:
	- `mkfs.fat -F 32 -n boot /dev/nvme0n1p1`
	- `mkswap -L swap /dev/vg/swap`
	- `swapon /dev/vg/swap`
	- `mkfs.btrfs -L root /dev/vg/root`
- Mount partitions:
	- `mount -t btrfs /dev/vg/root /mnt`
	- Create the subvolumes
        - `btrfs subvolume create /mnt/root`
        - `btrfs subvolume create /mnt/home`
        - `btrfs subvolume create /mnt/nix`
        - `btrfs subvolume create /mnt/log`
        - `umount /mnt`
	- Mount the directories
        - `mount -o subvol=root,compress=zstd,noatime,ssd,space_cache=v2 /dev/vg/root /mnt`
        - `mkdir -p /mnt/{home,nix,var/log}`
        - `mount -o subvol=home,compress=zstd,noatime,ssd,space_cache=v2 /dev/vg/root /mnt/home`
        - `mount -o subvol=nix,compress=zstd,noatime,ssd,space_cache=v2 /dev/vg/root /mnt/nix`
        - `mount -o subvol=log,compress=zstd,noatime,ssd,space_cache=v2 /dev/vg/root /mnt/var/log`
	- Mount boot partition
	    - `mkdir /mnt/boot`
	    - `mount /dev/nvme0n1p1 /mnt/boot`

5. Enable Flakes
    - `nix-shell -p nixFlakes`
6. Generate Nix Configuration
    - `sudo nixos-generate-config --force --dir /mnt/etc/nixos/hosts/linudev`
7. Remove configuration.nix 
    - `rm -rf /mnt/etc/nixos/hosts/linudev/configuration.nix`
8. Move to folder
- cd mnt/etc/nixos/

9. Install NixOS from flake:
    - `nixos-install --flake 'github:daniellukasdev/NixOS#dellxps'`
10. Reboot, login as root, and change the password for your user using passwd
    - `passwd username`
11. Log in as your normal user.
12. Install the home manager configuration
    - `home-manager switch --flake 'github:daniellukasdev/NixOS#dellxps'`

## Acknowledgements

- [github:rxyhn](https://github.com/rxyhn/yuki) - I based my config almost entirely on this one.
- [github:linuxmobile](https://github.com/linuxmobile/kaku) - I plan on possibly using the hyprland config from this one as a starting point.
