{ pkgs, lib, config, ... }:

let
  wms = config.my.wms;
  wmPkgs = with pkgs; [
    vicinae fuzzel mako waybar imv mpv wofi bluetuith swaybg hyprpicker hyprlock libnotify pamixer brightnessctl polkit_gnome swayidle udiskie opencode awscli2
  ];
in {
  options.local.extraPkgs = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
  };

  config = {
    users.users.${config.my.userName}.packages =
      (with pkgs; [
        zotero footage thunderbird kitty legcord zathura
        mpv libreoffice-fresh dconf-editor amberol loupe obsidian
        sone metadata-cleaner

        nmap ncpamixer file yazi gowall btop killall fastfetch
        wl-clipboard eza bun uv fzf ripgrep ripgrep-all fd tldr
        chezmoi gh zoxide lazygit hugo lazydocker zip unzip
        ffmpeg-full cargo hledger hledger-ui bat flatpak libqalculate
        sqlite gnumake42 nix-search-cli trash-cli dust httpie jq yq
        nvd gpu-screen-recorder pgcli k9s kubectl kubernetes-helm
        helmfile pandoc tesseract4 ocrmypdf

        statix tree-sitter python315 go pipenv nodejs_24

        texliveFull

        jetbrains.datagrip bruno vscode
      ])
      ++ lib.optionals (wms != [ ]) wmPkgs
      ++ lib.optionals (lib.elem "niri" wms) (with pkgs; [ xwayland-satellite nautilus ])
      ++ lib.optionals (lib.elem "sway" wms) (with pkgs; [ autotiling-rs grim slurp nautilus ])
      ++ config.local.extraPkgs;
  };
}
