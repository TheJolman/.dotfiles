{config, ...}: {
  age.secrets = {
    anthropic-api-key.file = ../../secrets/anthropic-api-key.age;
    groq-api-key.file = ../../secrets/groq-api-key.age;
  };

  environment.variables = {
    # ANTHROPIC_API_KEY = "$(cat ${config.age.secrets.anthropic-api-key.path})";
    # GROQ_API_KEY = "$(cat ${config.age.secrets.groq-api-key.path})";
  };
}
