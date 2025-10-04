{pkgs, ...}: {
  # gemini-cli installed with pnpm since it's updated so frequently
  home.file = {
    ".gemini/settings.json" = {
      force = true;
      text = builtins.toJSON {
        selectedAuthType = "oauth-personal";
        general = {
          preferredEditor = "nvim";
          vimMode = true;
        };
        privacy.usageStatisticsEnabled = false;
        telemetry.enabled = false;
        contextFileName = ["GEMINI.md" "AGENTS.md" "CLAUDE.md"];
        mcpServers = {
          svelte = {
            command = "${pkgs.nodejs}/bin/npx";
            args = ["-y" "@sveltejs/mcp"];
          };
          aws-knowledge = {
            httpUrl = "https://knowledge-mcp.global.api.aws";
          };
          cloudflare = {
            command = "${pkgs.nodejs}/bin/npx";
            args = ["mcp-remote" "https://docs.mcp.cloudflare.com/sse"];
          };
          terraform = {
            command = "docker";
            args = ["run" "-i" "--rm" "hashicorp/terraform-mcp-server"];
          };
        };
      };
    };
  };
}
