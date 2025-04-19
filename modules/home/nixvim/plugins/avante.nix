{...}: {
  programs.nixvim.plugins = {
    clipboard-image = {
      enable = true;
    };

    avante = {
      enable = true;
      autoLoad = true;

      settings = {
        provider = "claude";
        auto_suggestions_provider = "copilot";
        cursor_applying_provider = "groq";
        claude = {
          endpoint = "https://api.anthropic.com";
          model = "claude-3-7-sonnet-latest";
          temperature = 0;
          max_tokens = 4096;
        };
        vendors.groq = {
          __inherited_from = "openai";
          api_key_name = "GROQ_API_KEY";
          endpoint = "https://api.groq.com/openai/v1";
          model = "llama-3.3-70b-versatile";
          max_completion_tokens = 32768;
        };
        behaviour = {
          enable_claude_text_editor_tool_mode = true;
          enable_cursor_planning_mode = true;
          auto_suggestions = false;
          auto_set_hightlight_group = true;
          auto_set_keymaps = true;
          auto_apply_diff_after_generation = false;
          support_paste_from_clipboard = true;
          minimize_diff = true;
        };
      };
    };
  };
}
