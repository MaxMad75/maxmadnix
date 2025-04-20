{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    keepassxc
    discord
    nodejs

    sparrow
  ];
}
