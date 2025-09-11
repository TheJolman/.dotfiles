{...}: {
  # gemini-cli installed with pnpm since it's updated so frequently
  home.file = {
    ".gemini/settings.json".text = ''
      {
        "selectedAuthType": "oauth-personal",
        "general": {
          "preferredEditor": "nvim",
          "vimMode": true
        },
        "privacy": {
          "usageStatisticsEnabled": false
        },
        "telemetry": {
          "enabled": false
        }
      }
    '';
  };
}
