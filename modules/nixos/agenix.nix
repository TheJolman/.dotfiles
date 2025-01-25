{config, ...}: {
  age.secrets.secret1.file = ../../secrets/secret1.age;

  users.users.josh = {
    hashedPasswordFile = config.age.secrets.secret1.path;
  };
}
