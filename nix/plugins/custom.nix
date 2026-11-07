{ vimUtils, fetchFromGitHub }:
{
  everblush = vimUtils.buildVimPlugin {
    name = "everblush.nvim";
    src = fetchFromGitHub {
      owner = "Everblush";
      repo = "nvim";
      rev = "678f808d81801b983b6fb8296fb17ba1b2785d7c";
      hash = "sha256-1bX/wykK3/BKc1uRhRZD6QR/OezZY6XgyXg3a9UT3ec=";
    };
  };

  pastel = vimUtils.buildVimPlugin {
    name = "pastel.nvim";
    src = fetchFromGitHub {
      owner = "ankushbhagats";
      repo = "pastel.nvim";
      rev = "c2423b7c391cf49c8eab39a6e0e3770a49e01f22";
      hash = "sha256-bFIsCidLfHkJ6Ir4BElKBvVPeuJS+/S00A/tTYNYY60=";
    };
  };

  one-monokai = vimUtils.buildVimPlugin {
    name = "one_monokai.nvim";
    src = fetchFromGitHub {
      owner = "cpea2506";
      repo = "one_monokai.nvim";
      rev = "903b3e8923d67d3ee4b67f462b2b112012d7a69d";
      hash = "sha256-D2g8YmIQOc7tJpXs44riaLru2ogNsJhG+3EUcVfQ23A=";
    };
  };

  oldworld = vimUtils.buildVimPlugin {
    name = "oldworld.nvim";
    src = fetchFromGitHub {
      owner = "dgox16";
      repo = "oldworld.nvim";
      rev = "db072a0bd2c90035fc3a57a73014cb54d3902f1f";
      hash = "sha256-yO5XKSMwDu0/QYnoMbxWs+h0tfjftAYJYPrKO2XYfNQ=";
    };
  };
  
  ember = vimUtils.buildVimPlugin {
    name = "ember";
    src = fetchFromGitHub {
      owner = "ember-theme";
      repo = "nvim";
      rev = "6f8ca3d0f228fbd61e5aeeb5c68343c410720873";
      hash = "sha256-BTSilulR4R8K+jxn3ajt5BgakON9JP78t51i/qro+P0=";
    };
  };

  shale = vimUtils.buildVimPlugin {
    name = "shale.nvim";
    src = fetchFromGitHub {
      owner = "smit4k";
      repo = "shale.nvim";
      rev = "d16e1976ce2b554d0883b8287a6a956eb1776819";
      hash = "sha256-UDL5TgFbivilbTK0xyJOzRRmNcRREOe9lMPQS6CUO6g=";
    };
  };
}
