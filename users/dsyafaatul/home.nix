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
      ];
    })
    dbeaver-bin
    onlyoffice-desktopeditors
    neofetch
  ];

  home.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake ~/nix/#HPPavilion14";
  };
  
  home.stateVersion = "25.05";
}
