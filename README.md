# Neovim Configuration: Backend Automation Center

This is a modular configuration based on **LazyVim**, designed specifically for backend engineers in the **Ubuntu + Podman + Bun (TS)** environment.

## 🚀 Core Design Concepts
1. **Modular Classification**: Separating LSP, terminal, database, and UI for easier maintenance.
2. **Automated Development Flow**: Integrating common commands for Bun and Podman to improve development efficiency.
3. **IntelliJ IDEA Integration**: Retaining some of the operational intuition of IntelliJ IDEA.

## 📁 Directory Structure
- `lua/config/keymaps.lua`: Custom keymaps and automation commands.
- `lua/plugins/lsp.lua`: Syntax support for TypeScript (vtsls), JSON, XML, and YAML.
- `lua/plugins/terminal.lua`: ToggleTerm configuration (opened horizontally, suitable for monitoring logs).
- `lua/plugins/database.lua`: Connection management for databases such as SQL Server / MySQL.
- `lua/plugins/ui.lua`: Interface enhancements including Oil.nvim (file management), Aerial (code outline), etc.
- `lua/plugins/editor.lua`: Formatting, Treesitter syntax highlighting, and tool auto-installation list.

## ⌨️ Common Keymaps

### Automation Commands
- `<leader>r`: **Save and run** the current Bun script with one keypress.
- `<leader>pl`: View **Podman** container logs.

### Navigation & Search
- `<leader><leader>` (Double Space): **Quick file search** mimicking IntelliJ IDEA.
- `-`: Open the **Oil** file editor (move/rename files like editing text).
- `<leader>cs`: Open the **Aerial** code structure outline.

### Terminal & Database
- `Ctrl + t`: Toggle the bottom terminal.
- `<leader>db`: Toggle the **Dadbod UI** database interface.

### Formatting
- `<leader>f`: Format XML/JSON/TS and other files (integrated with Conform.nvim).

## 🛠️ Maintenance Instructions
- All tools (such as LSP Servers and Formatters) will be automatically installed via **Mason**.
- To add a new database connection, please modify `vim.g.dbs` in `lua/plugins/database.lua`.
- To modify the Podman container name, please adjust it in `lua/config/keymaps.lua`.
