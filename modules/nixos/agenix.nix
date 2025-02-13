{config, ...}: {
  age.secrets.anthropic-api-key = {
    file = ../../secrets/anthropic-api-key.age;
    owner = "josh";
  };

  environment.variables = {
    ANTHROPIC_API_KEY = "$(cat ${config.age.secrets.anthropic-api-key.path})";
    TEST = "hi there";
  };
}
