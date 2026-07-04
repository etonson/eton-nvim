# Neovim Environment Backup & Restore Guide

This document explains how to back up this Neovim configuration and quickly restore it in a reinstalled system or a new environment.

## 1. Backup Method (Push to Git)

It is recommended to host this configuration directory (`~/.config/nvim`) on GitHub or GitLab.

```bash
# If the remote repository is not configured yet
git remote add origin <your-repository-url>

# Commit and push changes
git add .
git commit -m "update: backup latest configuration"
git push -u origin master
```

---

## 2. Restore Method (On a New Computer)

Simply execute the following commands to restore the complete environment:

```bash
# 1. Download the configuration files
git clone <your-repository-url> ~/.config/nvim
cd ~/.config/nvim

# 2. Run the auto-setup script
bash setup.sh
```

---

## 3. Script (`setup.sh`) Content Description

`setup.sh` automatically handles the following:
1. **Install system dependencies**: `jq` (JSON), `xmllint` (XML), `curl`, `git`, `build-essential`.
2. **Install Neovim**: If Neovim is not installed, it automatically downloads and configures the stable version.
3. **Plugin synchronization**: Automatically runs `Lazy.nvim` to sync plugins.
4. **Tool installation**: Automatically runs `Mason` to install relevant LSP and formatting tools.

---

## 4. FAQ

### Q: Auto-formatting is not working?
- Ensure that `jq` and `xmllint` are installed on the system (the script installs them automatically).
- Run `:ConformInfo` to check the status of formatting tools.

### Q: How to manually trigger formatting?
- Use the keymap `<leader>f` (Space + f).
- Or it will be automatically triggered when saving the file (`:w`).

### Q: Is there support for `.si` files?
- Yes, `.si` files have been associated with the XML format in the configuration.
