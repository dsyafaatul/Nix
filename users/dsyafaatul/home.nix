{ config, pkgs, ... }:
{
  home.username = "dsyafaatul";
  home.homeDirectory = "/home/dsyafaatul";
  
  programs.git = {
    enable = true;
    userEmail = "dikisyafaatul@gmail.com";
    userName = "D. Syafa'atul Anbiya";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  
  home.stateVersion = "25.05";
}
