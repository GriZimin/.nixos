{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        
        extensions = with pkgs.vscode-extensions; [
          ms-vscode.cpptools           # Microsoft C/C++ tools (intellisense, debugging, etc.)
          ms-vscode.cmake-tools        # CMake integration
          twxs.cmake                   # CMake syntax highlighting
          ms-vscode.cpptools-extension-pack  # Meta-extension pack for C++
        ];

        userSettings = {
          "editor.formatOnSave" = true;
          "C_Cpp.intelliSenseEngine" = "Default";
          "C_Cpp.updateChannel" = "Default";
        };
    };
}
