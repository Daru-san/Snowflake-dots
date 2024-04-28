# Snowy Dots

My beautiful, functional, focused nix flake with Hyprland and Sway, written completely in nix.

**_Hosted at [SnowyDots](https://git.sr.ht/~darumaka/SnowyDots)_**

## Showcase

### Hyprland

![Image](https://imgur.com/Tm8C6SN.png 'I use Nix by the way')
![Image](https://i.imgur.com/JnzkFhK.png 'Neovim for winter days')
![image](https://imgur.com/3sTDYzG.png 'Why not take a look at my files?')
![image](https://i.imgur.com/Q0cOgNT.png 'Firefox looking amazing')
![Image](https://i.imgur.com/Vnck7Oi.png 'Read with me?')

## My System

### The base environment

#### Desktop environment

- Desktop: [Hyprland](https://github.com/hyprwm/Hyprland 'hyprland')
- Launcher: [anyrun](https://github.com/Kirottu/anyrun 'anyrun')
- Shell: [zsh](http://zsh.sourceforge.net/ 'zsh') configured with [oh-my-posh](https://ohmyposh.dev/), [antidote](https://getantidote.github.io/) and [prezto](https://github.com/sorin-ionescu/prezto)
- Editor: [SnowyVim](https://git.sr.ht/~darumaka/SnowyVim), my custom [Neovim](https://github.com/neovim/neovim) configuration made with [nixvim](https://github.com/nix-community/nixvim)
- Bar: [waybar](https://github.com/Alexays/Waybar 'waybar')
- Kernel: [Linux-zen](https://archlinux.org/packages/extra/x86_64/linux-zen/ 'zen')
- Lockscreen and idle: [hypridle](https://github.com/hyprwm/hypridle) and [hyprlock](https://github.com/hyprwm/hyprlock)

## Installing NixOS

I use my own custom nixos iso to install NixOS on my systems, the flake is at [SnowISO](https://git.sr.ht/~darumaka/SnowISO) on sr.ht. It has plenty of useful tools and has sway as a desktop for graphical installs.

### Installation

```bash
# Boot into the installer
# Connect to wifi, instructions on the wiki, link in the helpful links section.
# My installer has network manager installed so I use that instead of wpa utility

# Enter root shell
sudo -i

# Create you partitions, I personally use cfdisk, but you can use any tool e.g parted
cfdisk

# Format your partitions
mkfs.ext4 -L root /dev/root-partition # your partition name here

# It isn't necessary to separate home and root but I do it anyway
mkfs.ext4 -L home /dev/home-partition

# This may not be useful if you use zram but in my case I use both zram and swap partitions
# I'll work on using zram on it's own
# I primarily use swap partitions instead of swap files, set up one like this
mkswap -L swap /dev/swap-partition # replace with your partition
swapon /dev/by-label/swap

# Mount your partitions
mount /dev/by-label/root /mnt
mount --mkdir /dev/boot-partition /mnt/boot
mount --mkdir /dev/by-label/home /mnt/home

nixos-generate-config --root /mnt

# Edit the configuration
cd /mnt/etc/nixos
vi configuration.nix

# Check the partitions to make sure their mount points are correct
# Also check for swap if you're using a partition
vi hardware-configuration.nix

# Once you're done, install the system configuration
nixos-install
```

### Deploy my config

```bash
# Clone the github repo
git clone https://github.com/Daru-san/Snowflake-dots

# or the sourcehut repo, which is more up-to-date
git clone https://git.sr.ht/~darumaka/SnowyDots

# You should probably make your own system configurations for compatibility
# Feel free to edit any files in the repo to suit your needs, otherwise

cd Snowflake-dots/systems/AspireLaptop

# Copy your partitions to the hardware-configuration.nix file
vi hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#system e.g .#AspireLaptop

# Then build the home configuration

# If you haven't installed it yet
nix-shell -p home-manager

# Then switch the config
home-manager switch --flake .#daru@AspireLaptop
```

## Resources

### Useful resources

- [NixOS Manual](https://nixos.org/manual/nixos/unstable/ 'nix')
- [Nix best practices](https://nix.dev/guides/best-practices.html)
- [NixOS wiki](https://nixos.wiki 'nix-wiki')
- [MyNixOS](https://mynixos.com 'Best nix resource')
- [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

### Inspirations

- [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers 'walls')
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles/ 'fufexan dots')
- [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config 'dots')
- [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs 'nix-starter-configs')
