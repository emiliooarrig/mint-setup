#!/bin/bash

echo "Instalacion de herramientas de desarrollo"

# Instalar herramientas de desarrollo usando el gestor YUM
sudo yum install -y python3
sudo yum install -y gcc
sudo yum install -y tor
sudo yum install -y php php-mysql mysql-server php-cli php-curl
sudo yum install -y docker

echo "Instalacion de Neovim (nvim) "
# Limpiar instalaciones previas
sudo rm -rf /opt/nvim
sudo rm -f /usr/local/bin/nvim

# Instalacion de neovim en el sistema
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz

# Mensaje de confirmacion para el usuario
echo -e "Neovim instalado: $(nvim --version | head -n 1)"

# Configuracion de Neovim
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
# Eliminar carpeta .git para que puedas hacer tu propio repo después
rm -rf "$HOME/.config/nvim/.git"
