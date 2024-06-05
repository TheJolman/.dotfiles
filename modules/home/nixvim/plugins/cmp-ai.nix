# this file is currently unused
{pkgs, ...}: {
  # extraPlugins = with pkgs.vimPlugins; [
  #   {
  #     plugin =
  #   }
  # ];
  programs.nixvim.extraConfigLua = ''
    local cmp_ai = require('cmp_ai.config')

    cmp_ai:setup({
      max_lines = 1000,
      provider = 'Codestral',
      provider_options = {
        model = 'codestral-latest',
      },
      notify = true,
      notify_callback = function(msg)
        vim.notify(msg)
      end,
      run_on_every_keystroke = true,
      ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
      },
    })
  '';
}
