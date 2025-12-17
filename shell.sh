#!/bin/bash

# Colores para los mensajes
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${AZUL} Iniciando instalación automatizada de entorno de desarrollo ${NC}"

# --- 1. DETECCIÓN DE DISTRO Y DEPENDENCIAS ---
echo -e "${AZUL} Detectando distribución e instalando dependencias base${NC}"

if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
  OS=$(lsb_release -si)
fi

if [[ "$OS" == *"Debian"* ]] || [[ "$OS" == *"Ubuntu"* ]] || [[ "$OS" == *"Mint"* ]] || [[ "$OS" == *"Pop"* ]]; then
  sudo apt update
  sudo apt install -y git curl wget unzip tar build-essential ripgrep fd-find
elif [[ "$OS" == *"Fedora"* ]] || [[ "$OS" == *"Alma"* ]] || [[ "$OS" == *"Red Hat"* ]]; then
  sudo dnf install -y git curl wget unzip tar make automake gcc gcc-c++ kernel-devel ripgrep fd-find
elif [[ "$OS" == *"Arch"* ]] || [[ "$OS" == *"Manjaro"* ]] || [[ "$OS" == *"Endeavour"* ]]; then
  sudo pacman -Syu --noconfirm git curl wget unzip tar base-devel ripgrep fd
else
  echo "No se pudo detectar la distro automáticamente. Asegúrate de tener instalados: git, curl, ripgrep, fd y gcc."
fi
# Instalando herramientas de desarrollo
echo -e "${AZUL} Instalando herramientas de desarrollo... ${NC}"
# Compilador de C++
sudo apt install gcc
# Python3
sudo apt install python3
# PHP y mysql-server para desarrollo web
sudo apt install php php-mysql mysql-server php-cli php-curl
# Para enrutamiento de cebolla
sudo apt install tor
# Instalando node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Instalando tmux
sudo apt install tmux

# --- 2. INSTALACIÓN DE NEOVIM (Método Tarball Universal) ---
echo -e "${AZUL} Instalando Neovim (Latest Stable)...${NC}"

# Limpiar instalaciones previas
sudo rm -rf /opt/nvim
sudo rm -f /usr/local/bin/nvim

# Descargar e instalar
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz

echo -e "${VERDE}✔ Neovim instalado: $(nvim --version | head -n 1)${NC}"

# --- 3. CONFIGURACIÓN DE LAZYVIM ---
echo -e "${AZUL}💤 Configurando LazyVim...${NC}"

# Respaldo de seguridad si existe config previa
if [ -d "$HOME/.config/nvim" ]; then
  echo "Respaldando configuración existente a .config/nvim.bak..."
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
  mv "$HOME/.local/share/nvim" "$HOME/.local/share/nvim.bak.$(date +%s)"
fi

# Clonar LazyVim Starter
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"

# Eliminar carpeta .git para que puedas hacer tu propio repo después
rm -rf "$HOME/.config/nvim/.git"

echo -e "${VERDE}✔ LazyVim clonado correctamente.${NC}"

# --- 4. INSTALACIÓN DE FUENTES (Nerd Fonts) ---
echo -e "${AZUL}ABC Instalando JetBrainsMono Nerd Font...${NC}"

mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts"
curl -fLo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o -q JetBrainsMono.zip
rm JetBrainsMono.zip

# Actualizar caché de fuentes
if command -v fc-cache >/dev/null 2>&1; then
  echo "Actualizando caché de fuentes..."
  fc-cache -fv >/dev/null
fi

echo -e "${VERDE}✔ Fuentes instaladas.${NC}"
echo -e "${AZUL}⚠️ IMPORTANTE: Recuerda configurar tu terminal manualmente para usar 'JetBrainsMono Nerd Font'.${NC}"

echo -e "${VERDE}✨ ¡Instalación completada! Escribe 'nvim' para empezar.${NC}"
