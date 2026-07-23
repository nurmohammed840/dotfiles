{ pkgs, ... }:

{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    
    # ./desktop/cosmic.nix
    ./desktop/gnome.nix
    # ./desktop/niri.nix

    ./dev/flutter.nix

    ./programs/wireshark.nix
    ./programs/input.kanata.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    # Use the systemd-boot EFI boot loader.
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "home";
    # Configure network connections interactively with nmcli or nmtui.
    networkmanager.enable = true; 
    
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nur = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
    ];
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [];

  programs.steam.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  fileSystems."/media/hdd" = {
    # Run `lsblk -f` to get disk info
    device = "/dev/disk/by-uuid/6A4E47214E46E583";
    fsType = "ntfs3";
    options = [
      # belong to; run `id` to get user id
      "uid=1000" "gid=100"
      "umask=000" # everyone can access
      "nofail"
    ];
  };

  services = {
    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # openssh.enable = true;
    
    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;

    # Configure keymap in X11
    # xserver.xkb.layout = "us";
    # xserver.xkb.options = "eurosign:e,caps:escape";

    # Enable CUPS to print documents.
    # printing.enable = true;


    # Enable sound.
    # pulseaudio.enable = true;
    # OR
    # pipewire = {
    #   enable = true;
    #   pulse.enable = true;
    # };
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

  # security.sudo.wheelNeedsPassword = false;

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    max-jobs = "auto";
    http-connections = 64;
    max-substitution-jobs = 64;
    fallback = false;
    auto-optimise-store = true;
    substituters = [
      # "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      # "https://mirror.sjtu.edu.cn/nix-channels/store"
      # "https://mirrors.ustc.edu.cn/nix-channels/store"

      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
