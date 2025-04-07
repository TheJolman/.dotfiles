{config, ...}: {
  age.secrets = {
    anthropic-api-key = {
      file = ../../secrets/anthropic-api-key.age;
      owner = "josh";
      group = "josh";
    };

    polygon-api-key = {
      file = ../../secrets/polygon-api-key.age;
      owner = "josh";
      group = "josh";
    };
  };

  environment.variables = {
    ANTHROPIC_API_KEY = "$(cat ${config.age.secrets.anthropic-api-key.path})";
    POLYGON_API_KEY = "$(cat ${config.age.secrets.polygon-api-key.path})";
  };
}
