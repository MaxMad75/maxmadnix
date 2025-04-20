{username, ...}: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "${username}";
    dataDir = "/home/${username}/syncthing/";
    configDir = "/home/${username}/.config/syncthing";
  };
}
