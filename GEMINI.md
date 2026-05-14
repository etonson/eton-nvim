# Project Instructions: Neovim Backend Automation Center

## Architecture
- **Modular Plugin System**: Plugins are categorized in `lua/plugins/` (lsp, terminal, database, ui, editor).
- **LazyVim Base**: Built on top of LazyVim.

## Tech Stack & Environment
- **OS**: Ubuntu
- **Runtime**: Bun (TypeScript)
- **Container**: Podman
- **Language Servers**: vtsls (for Bun/TS), jsonls, yamlls, lemminx (XML), jdtls (Java).

## Development Workflows
- **TypeScript**: Use `<leader>r` to run the current Bun script.
- **Containers**: Use `<leader>pl` to check Podman logs (configure container name in `lua/config/keymaps.lua`).
- **File Management**: Use `oil.nvim` (via `-`) for bulk renaming/moving.
- **Formatting**: Forced Unix (LF) line endings. Format with `<leader>f`.

## Conventions
- Always prioritize **Unix (LF)** line endings.
- Keep plugin configurations modular.
- Maintain IDEA-like shortcuts where possible (e.g., double Space for file search).
