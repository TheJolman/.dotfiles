{lib, pkgs, ...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        # asm-lsp.enable = true;
        bashls.enable = true;
        cmake.enable = true;
        clangd.enable = true;
        # gleam.enable = true; # works just not using gleam atm
        jsonls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;

        jdt-language-server.enable = true;
      };
      onAttach = ''
        local bufmap = function(keys, func)
          vim.keymap.set("n", keys, func, { buffer = bufnr })
        end

        bufmap("<leader>r", vim.lsp.buf.rename)
        bufmap("<leader>a", vim.lsp.buf.code_action)

        bufmap("gd", vim.lsp.buf.definition)
        bufmap("gD", vim.lsp.buf.declaration)
        bufmap("gi", vim.lsp.buf.implementation)
        bufmap("gtd", vim.lsp.buf.type_definition)

        bufmap("gr", require("telescope.builtin").lsp_references)
        bufmap("gs", require("telescope.builtin").lsp_document_symbols)
        bufmap("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols)

        bufmap("K", vim.lsp.buf.hover)

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, {})

      '';
    };
    # nvim-jdtls = {
    #   enable = true;
    #   cmd = [
    #     (lib.getExe pkgs.jdt-language-server)
    #     "-data" ""
    #     "-configuration" "~/.cache/jdtls/config"
    #   ];
    # };
    # extraConfigLua = ''
    # '';
  };
}
