# Mi Entorno de Desarrollo 

Este repositorio contiene un script de automatización para configurar un entorno de desarrollo profesional en sistemas Linux (Debian/Ubuntu/Mint, Fedora/RHEL o Arch Linux). 

Está diseñado para que, cada vez que instale una nueva distribución o configure un servidor, pueda tener mis herramientas listas en menos de 5 minutos.

## ¿Qué incluye este entorno?

El script de instalación (`install.sh`) configura automáticamente:

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
git clone https://github.com/TU_USUARIO/TU_REPO.git](https://github.com/TU_USUARIO/TU_REPO.git
cd TU_REPO

# 2. Dar permisos de ejecución
chmod +x install.sh

# 3. Ejecutar la instalación
./install.sh


