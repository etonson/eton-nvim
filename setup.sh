#!/bin/bash

# Neovim 環境快速設定腳本 (Ubuntu/Debian 範例)
# 執行方式: bash setup.sh

set -e

echo "開始設定 Neovim 環境..."

# 1. 安裝系統依賴
echo "正在安裝系統工具 (jq, libxml2-utils, git, curl)..."
if [ -x "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y jq libxml2-utils git curl build-essential
elif [ -x "$(command -v brew)" ]; then
    brew install jq libxml2 git curl
else
    echo "未偵測到支援的套件管理員 (apt/brew)，請手動安裝 jq 與 xmllint (libxml2)。"
fi

# 2. 安裝 Neovim (如果尚未安裝)
if ! command -v nvim &> /dev/null; then
    echo "未偵測到 nvim，正在安裝最新穩定版..."
    # 這裡以 Ubuntu 為例，實際可根據需求調整安裝方式
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
    export PATH="$PATH:/opt/nvim-linux64/bin"
    rm nvim-linux64.tar.gz
fi

# 3. 備份舊的設定 (如有)
NVIM_CONFIG="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG" ]; then
    echo "備份舊的 Neovim 設定到 $NVIM_CONFIG.bak"
    rm -rf "$NVIM_CONFIG.bak"
    mv "$NVIM_CONFIG" "$NVIM_CONFIG.bak"
fi

# 4. 複製當前設定 (假設您在設定檔目錄下執行此腳本)
# 或是您可以將此腳本放在 git repo 中，直接 clone
echo "正在部署 Neovim 設定..."
mkdir -p "$HOME/.config"
cp -r . "$NVIM_CONFIG"

# 5. 啟動 Neovim 並安裝套件
echo "正在安裝插件與工具 (Lazy.nvim & Mason)..."
# 使用 headless 模式執行安裝
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonToolsInstall" +qa

echo "------------------------------------------------"
echo "Neovim 環境設定完成！"
echo "提示: 第一次開啟 nvim 時，Mason 可能還在背景安裝部分工具 (如 jq, lemminx)。"
echo "------------------------------------------------"
