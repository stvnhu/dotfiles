{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home = {
    username = "stvnhu";
    homeDirectory = "/home/stvnhu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  home.file = {
    ".bashrc".source = symlink "${dotfiles}/bash/.bashrc";
    ".vimrc".source = symlink "${dotfiles}/vim/.vimrc";
    ".tmux.conf".source = symlink "${dotfiles}/tmux/.tmux.conf";
  };
  xdg.configFile = {
    "home-manager".source = symlink "${dotfiles}/home-manager";
    "i3".source = symlink "${dotfiles}/i3";
    "i3status-rust".source = symlink "${dotfiles}/i3status-rust";
    "alacritty".source = symlink "${dotfiles}/alacritty";
    "nvim".source = symlink "${dotfiles}/nvim";
    "Code/User/settings.json".source = symlink "${dotfiles}/vscode/settings.json";
    "rofi".source = symlink "${dotfiles}/rofi";
  };
}
