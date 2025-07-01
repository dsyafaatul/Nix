{ config, pkgs, ... }:
{
  home.username = "dsyafaatul";
  home.homeDirectory = "/home/dsyafaatul";
  
  programs = {
    git = {
      enable = true;
      userEmail = "dikisyafaatul@gmail.com";
      userName = "D. Syafa'atul Anbiya";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = true;
  };

  home.packages = with pkgs; [
    google-chrome
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        mhutchie.git-graph
        donjayamanne.githistory
        github.copilot
        github.copilot-chat
      ];
    })
    dbeaver-bin
    onlyoffice-desktopeditors
    vlc
    blender
    obs-studio
    zoom-us
    telegram-desktop
    anydesk
    monitor
    neofetch
  ];

  home.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake ~/nix/#HPPavilion14";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "io/elementary/desktop/background" = {
      dim-wallpaper-in-dark-style = true;
    };
    "io/elementary/dock" = {
      icon-size = 32;
      autohide-mode = "overlapping-window";
    };
    "io/elementary/desktop/wm/behavior" = {
      move-maximized-workspace = true;
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "io.elementary.terminal";
      name = "io.elementary.terminal";
    };
    "io/elementary/desktop/wingpanel/power" = {
      show-percentage = true;
    };
    "com/github/stsdc/monitor/settings" = {
      indicator-state = true;
      indicator-cpu-state = true;
      indicator-cpu-frequency-state = true;
      indicator-cpu-temperature-state = true;
      indicator-memory-state = true;
      indicator-network-upload-state = true;
      indicator-network-download-state = true;
      background-state = true;
      containers-view-state = true;
    };
  };

  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.monitor}/share/applications/com.github.stsdc.monitor.desktop"
    ];
  };
  
  home.stateVersion = "25.05";
}
