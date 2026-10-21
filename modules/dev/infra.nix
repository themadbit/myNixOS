{ pkgs, ... }:

{
  services.tailscale = {
    enable = true;
  };
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    authentication = ''
      local all sil_authserver md5
      local all forge_test md5
      local all edi trust
    '';
    ensureUsers = [
      {
        name = "sil_authserver";
        ensureDBOwnership = true;
      }
      {
        name = "forge_test";
        ensureDBOwnership = true;
      }
      {
        name = "edi";
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [
      "sil_authserver"
      "forge_test"
      "edi"
    ];
  };
  services.k3s = {
    enable = false;
    role = "server";
  };
  services.rabbitmq = {
    enable = false;
  };
}
