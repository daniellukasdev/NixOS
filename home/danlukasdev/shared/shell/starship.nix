{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with builtins; let
  promptOrderLeft = [
    "os"
    "username"
    "sudo"
    "directory"
    "git_branch"
    "git_state"
    "git_status"
    "git_metrics"
    "custom.endLine"
    "fill"
  ];

  promptOrderRight = [
  ];
  promptFormatLeft = concatStrings (map (s: "\$${s}") promptOrderLeft);
  promptFormatRight = concatStrings (map (s: "\$${s}") promptOrderRight);

  starShipConfig = {
    # format = "$directory$git_branch$git_metrics$git_commit$git_state$git_status$all";
    format = promptFormatLeft;
    # right_format = promptFormatRight; # [ } ](red bold)
    right_format = "[ } ](red bold)";
    scan_timeout = 10;

    # Disable the blank line at the start of the prompt
    add_newline = false;
    line_break.disabled = false;

    # character = {
    #   success_symbol = "[λ](green)";
    #   error_symbol = "[λ](red)";
    #   vimcmd_symbol = "[λ](green)";
    # };

    # directory = {
    #   home_symbol = "home";
    #   style = "cyan";
    # };

    # git_commit.tag_symbol = " tag ";
    # git_branch = {
    #   style = "purple";
    #   symbol = "";
    # };

    # git_metrics = {
    #   added_style = "bold yellow";
    #   deleted_style = "bold red";
    #   disabled = false;
    # };

    # aws.symbol = "aws ";
    # bun.symbol = "bun ";
    # c.symbol = "C ";
    # cobol.symbol = "cobol ";
    # conda.symbol = "conda ";
    # crystal.symbol = "cr ";
    # cmake.symbol = "cmake ";
    # daml.symbol = "daml ";
    # dart.symbol = "dart ";
    # deno.symbol = "deno ";
    # dotnet.symbol = ".NET ";
    # directory.read_only = " ro";
    # docker_context.symbol = "docker ";
    # elixir.symbol = "exs ";
    # elm.symbol = "elm ";
    # golang.symbol = "go ";
    # guix_shell.symbol = "guix ";
    # hg_branch.symbol = "hg ";
    # java.symbol = "java ";
    # julia.symbol = "jl ";
    # kotlin.symbol = "kt ";
    # lua.symbol = "lua ";
    # memory_usage.symbol = "memory ";
    # meson.symbol = "meson ";
    # nim.symbol = "nim ";
    # nix_shell.symbol = "nix ";
    # ocaml.symbol = "ml ";
    # opa.symbol = "opa ";
    # nodejs.symbol = "nodejs ";
    # package.symbol = "pkg ";
    # perl.symbol = "pl ";
    # php.symbol = "php ";
    # pulumi.symbol = "pulumi ";
    # purescript.symbol = "purs ";
    # python.symbol = "py ";
    # raku.symbol = "raku ";
    # ruby.symbol = "rb ";
    # rust.symbol = "rs ";
    # scala.symbol = "scala ";
    # spack.symbol = "spack ";
    # sudo.symbol = "sudo ";
    # swift.symbol = "swift ";
    # terraform.symbol = "terraform ";
    # zig.symbol = "zig ";

    os = {
      disabled = false;
      format = "[┌錄](bold bright-blue)[](bright-blue)[ ](bg:bright-blue fg:bright-white)[](fg:bright-blue bg:blue)";
    };

    username = {
      format = "[ 󰮭 ]($style)[](bold fg:blue bg:bright-black)";
      show_always = true;
      style_user = "fg:black bg:blue ";
    };

    hostname = {
      ssh_only = false;
      trim_at = ".companyname.com";
      disabled = false;
      style = "bold bg:bright-blue fg:bright-white";
      format = "[ ]($style)";
    };

    sudo = {
      style = "bold fg:yellow bg:bright-black";
      symbol = " ";
      format = "[$symbol]($style)[](bright-black)";
      disabled = false;
    };

    fill = {
      symbol = " ";
      style = "bold white";
    };

    directory = {
      style = "fg:blue bg:black";
      read_only = " ";
      repo_root_style = "fg:bright-blue bg:black bold";
      truncation_length = 2;
      truncate_to_repo = false;
      truncation_symbol = " …/";
    };

    directory.substitutions = {
      "~" = "  ";
      "blender" = " ";
      "Documents" = " ";
      "Downloads" = " ";
      ".git" = " ";
      "Music" = " ";
      "Pictures" = " ";
      "wine" = " ";
    };

    character = {
      # success_symbol = "[](purple)";
      success_symbol = "[](green bold)";
      error_symbol = "[ﮊ](red)";
      vicmd_symbol = "[](green)";
    };

    git_branch = {
      symbol = " ";
      format = "[$symbol$branch]($style) [( ](yellow bold)";
      style = "purple bold";
    };

    jobs = {
      symbol = "";
      style = "fg:black bg:white";
      number_threshold = 0;
      symbol_threshold = 1;
      format = "[ $symbol]($style)";
    };

    custom.giturl = {
      # disabled = true;
      description = "Display symbol for remote Git server";
      command = "check-git-remote";
      when = "git rev-parse --is-inside-work-tree 2> /dev/null";
      shell = "['bash', '--noprofile', '--norc']";
      format = "at $output  ";
    };

    git_status = {
      # format = "([\[$all_status$ahead_behind\]]($style) )";
      # style = "cyan";
      conflicted = "=";
    };

    git_state = {
      format = "([$state( $progress_current/$progress_total)]($style)) ";
      style = "bright-black";
    };

    git_metrics = {
      disabled = false;
    };

    custom.endLine = {
      command = "echo )";
      format = "$output[ ⟹ ](purple bold)[ { ](red bold)";
      shell = "['bash', 'zsh', '--noprofile', '--norc']";
      style = "yellow bold";
      when = true;
    };

    cmd_duration = {
      format = "[ $duration 羽]($style)";
      style = "fg:black bg:white";
    };

    memory_usage = {
      symbol = " ";
    };

    nodejs = {
      format = "[$symbol($version )]($style)";
    };

    python = {
      symbol = "  ";
      format = "[$symbol]($version)";
    };

    rust = {
      symbol = " ";
    };

    time = {
      disabled = false;
      style = "fg:black bg:white";
      format = "[ $time  ]($style)";
    };

    custom.zsh = {
      command = "echo 🚀";
      when = " test '$STARSHIP_SHELL' '==' 'zsh' ";
      format = "$output";
    };
  };
in {
  # home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
