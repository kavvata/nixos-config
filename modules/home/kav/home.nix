{
  lib,
  ...
}:

{
  imports = [
    ../../colorschemes
    ./dotfiles/bluetuith.nix
    ./dotfiles/foot.nix
    ./dotfiles/fontconfig
    ./dotfiles/fuzzel.nix
    ./dotfiles/gowall
    ./dotfiles/gtk.nix
    ./dotfiles/herdr.nix
    ./dotfiles/hyprlock.nix
    ./dotfiles/ideavimrc
    ./dotfiles/kitty.nix
    ./dotfiles/lazygit.nix
    ./dotfiles/mako
    ./dotfiles/niri
    ./dotfiles/sway
    ./dotfiles/swaylock.nix
    ./dotfiles/tmux
    ./dotfiles/wofi
    ./dotfiles/zathura
    ./dotfiles/waybar
  ];

  # Active colorscheme for the dotfiles (available: see ../../colorschemes)
  colorscheme = lib.mkDefault "oneDark";

  home = {
    username = "kav";
    homeDirectory = "/home/kav";
    stateVersion = "25.11";

    packages = [ ];

    file = { };

    sessionVariables = { };
  };

  programs.home-manager.enable = true;
}
