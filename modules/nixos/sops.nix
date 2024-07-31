{config,...}: {

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  # will build even if file is not found
  sops.age.keyFile = "/home/josh/.config/sops/age/keys.txt";
  sops.secrets.CODESTRAL_API_KEY = {owner = config.users.users.josh.name;};
}
