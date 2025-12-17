# Mi Entorno de Desarrollo 

Este repositorio contiene un script de automatización para configurar un entorno de desarrollo profesional en sistemas Linux (Debian/Ubuntu/Mint, Fedora/RHEL o Arch Linux). 

Está diseñado para que, cada vez que se instale una nueva distribución de Linux, se obtenga herramientas de desarrollo listas en menos de 5 minutos.

## ¿Qué incluye este entorno?

El script de instalación (`shell.sh`) configura automáticamente:

* **Neovim (v0.10+)**: Instalado mediante binarios oficiales para asegurar la última versión.
* **LazyVim**: Una configuración de Neovim rápida y moderna con soporte para plugins.
* **JetBrainsMono Nerd Font**: Esencial para ver iconos y glifos en la terminal.
* **Herramientas de Sistema**: `git`, `curl`, `ripgrep`, `fd-find`, `unzip`, `build-essential`.
* **Contenedores**: Instalación rápida de contenedores de Docker.
* **Lenguajes y Servidores**: Soporte base para Python, PHP, MySQL y GCC (Compilador GNU de C++).
* **Privacidad**: Instalación del servicio de `tor`.

## Cómo usar este repositorio

Para configurar tu sistema desde cero, abre una terminal y ejecuta:

```bash
# 1. Clonar el repositorio
git clone https://github.com/emiliooarrig/mint-setup.git
cd mint-setup/

# 2. Dar permisos de ejecución
chmod +x shell.sh

# 3. Ejecutar la instalación
./shell.sh
