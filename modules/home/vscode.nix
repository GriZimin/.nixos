{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools # Microsoft C/C++ tools (intellisense, debugging, etc.)
      ms-vscode.cmake-tools # CMake integration
      twxs.cmake # CMake syntax highlighting
      ms-vscode.cpptools-extension-pack # Meta-extension pack for C++
      bbenoist.nix # basic Nix syntax
      jnoortheen.nix-ide # advanced IDE support (recommended)
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];

    userSettings = {
      "editor.formatOnSave" = true;
      "C_Cpp.intelliSenseEngine" = "Default";
      "C_Cpp.updateChannel" = "Default";

      "vim.insertModeKeyBindings" = [
        {
          "before" = [
            "j"
            "k"
          ];
          "after" = [ "<Esc>" ];
        }
      ];

      "vim.timeout" = 200; # milliseconds
      "vim.timeoutlen" = 200;
      "vim.leader" = "<space>";

      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          "before" = [
            "<leader>"
            "e"
          ];
          "commands" = [ "workbench.view.explorer" ];
        }
        {
          "before" = [ "<C-h>" ];
          "commands" = [ "workbench.action.focusLeftGroup" ];
        }
        {
          "before" = [ "<C-l>" ];
          "commands" = [ "workbench.action.focusRightGroup" ];
        }
        {
          "before" = [ "<C-j>" ];
          "commands" = [ "workbench.action.focusBelowGroup" ];
        }
        {
          "before" = [ "<C-k>" ];
          "commands" = [ "workbench.action.focusAboveGroup" ];
        }
        {
          "before" = [
            "<leader>"
            "f"
          ];
          "commands" = [ "workbench.action.quickOpen" ];
        }
        {
          "before" = [
            "<leader>"
            "p"
          ];
          "commands" = [ "workbench.action.showCommands" ];
        }
        {
          "before" = [
            "leader"
            "."
          ];
          "commands" = [ "workbench.action.nextEditor" ];
        }
        {
          "before" = [
            "leader"
            ","
          ];
          "commands" = [ "workbench.action.previousEditor" ];
        }
        {
          "before" = [
            "<leader>"
            "t"
            "t"
          ];
          "commands" = [ "workbench.action.terminal.toggleTerminal" ];
        }
        {
          "before" = [
            "leader"
            "t"
          ];
          "commands" = [ "workbench.action.terminal.focus" ];
        }
        {
          "before" = [
            "<leader>"
            "E"
          ];
          "commands" = [ "workbench.action.focusActiveEditorGroup" ];
        }
      ];
    };
  };
}
