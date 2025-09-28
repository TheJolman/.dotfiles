{...}: {
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true; # convert tabs to spaces
      tabstop = 2; # tab width
      shiftwidth = 2; # indent size
      autoindent = true;
      smartindent = true;
      pumheight = 10;
      pumwidth = 10;
      cursorline = true;
      wildmenu = true;
      showmatch = true;
      matchtime = 3;
      autoread = true;
      termguicolors = true;
      colorcolumn = "100"; # this has to be a string for some reason
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      scrolloff = 8;
      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      hidden = true;
      completeopt = ["menuone" "noselect"];
      gdefault = true;
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldlevelstart = 99;
      splitbelow = true;
      splitright = true;
      conceallevel = 3;
      concealcursor = "";
      listchars.tab = "→ ";
      list = true;
      showbreak = "↪ ";
      laststatus = 3; # avante wants this
      breakindent = true;
      wrap = false;
      sidescroll = 5;
      listchars.precedes = "<";
      listchars.extends = ">";
      confirm = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
