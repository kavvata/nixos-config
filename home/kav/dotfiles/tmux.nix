{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    historyLimit = 4096;
    mouse = true;
    terminal = "screen-256color";

    customPaneNavigationAndResize = true;
    resizeAmount = 3;

    secureSocket = false;

    plugins = [
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.tmux-fzf
      pkgs.tmuxPlugins.resurrect
    ];

    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };
}
