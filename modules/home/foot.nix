{...}: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Iosevka Nerd Font:size=13";
        pad = "6x6";
      };
      cursor = {
        style = "beam";
        blink = "yes";
        blink-rate = 500;
      };

      colors-dark = {
        alpha = 0.8;
        background = "080808";
        foreground = "bdbdbd";

        cursor = "080808 9e9e9e";

        # Normal/regular colors (color palette 0-7)
        regular0 = "323437";
        regular1 = "ff5d5d";
        regular2 = "8cc85f";
        regular3 = "e3c78a";
        regular4 = "80a0ff";
        regular5 = "cf87e8";
        regular6 = "79dac8";
        regular7 = "c6c6c6";

        # Bright colors (color palette 8-15)
        bright0 = "949494";
        bright1 = "ff5189";
        bright2 = "36c692";
        bright3 = "c6c684";
        bright4 = "74b2ff";
        bright5 = "ae81ff";
        bright6 = "85dc85";
        bright7 = "e4e4e4";

        selection-foreground = "080808";
        selection-background = "b2ceee";

        urls = "79dac8";
      };
    };
  };
}
