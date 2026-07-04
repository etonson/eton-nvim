# Shell Script Development Environment Setup (Shell Setup)

This document records how to set up the development environment for Shell scripts, including Linter settings and the handling of line endings.

## 🛠 Tool Installation

### 1. System-Level Tools
Install `shellcheck` (static analysis tool) and `dos2unix` (format conversion tool):
```bash
sudo apt update
sudo apt install -y shellcheck dos2unix
```

## ⚙️ Neovim Configuration

### 1. Enable Shell Language Support
Currently configured manually and managed via `lua/plugins/editor.lua` and `lua/plugins/lsp.lua`. Make sure they are installed:
- **Linter**: `shellcheck`
- **Formatter**: `shfmt`

### 2. Mason Auto-Installation
In `lua/plugins/editor.lua`, `shellcheck` and `shfmt` have been added to the `ensure_installed` list, so Mason will automatically install them upon startup.

### 3. Enforce Unix Line Endings (LF)
To prevent `\r` errors when running scripts on Linux, the following configurations have been made in `lua/config/options.lua`:
```lua
vim.opt.fileformat = "unix"      -- Default new files to use LF
vim.opt.fileformats = "unix"     -- Force using unix format, ignoring dos detection
```

## 🔍 Troubleshooting

### Encountering `rm: cannot remove ... \r: No such file or directory`
This indicates that the file uses the Windows CRLF format.

**Solution A: Use dos2unix (Recommended)**
```bash
dos2unix <filename>
```

**Solution B: Convert within Neovim**
1. Open the file.
2. Execute the command `:set ff=unix`.
3. Save the file `:w`.

**Solution C: Quick fix using sed**
```bash
sed -i 's/\r$//' <filename>
```
