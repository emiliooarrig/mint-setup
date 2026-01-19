# Entorno de Desarrollo 

Este repositorio contiene scripts de automatización para configurar un entorno de desarrollo profesional en sistemas Linux (Fedora/RHEL o Arch Linux). 

Estan diseñados para que, cada vez que se instale una nueva distribución de Linux, se obtenga herramientas de desarrollo de software listas en menos de 5 minutos.

## ¿Qué incluye este entorno?

El script de instalación (`shell.sh` o `fedora.sh`) configura automáticamente:

* **Neovim (v0.10+)**: Instalado mediante binarios oficiales para asegurar la última versión.
* **LazyVim**: Una configuración de Neovim rápida y moderna con soporte para plugins.
* **JetBrainsMono Nerd Font**: Esencial para ver iconos y glifos en la terminal.
* **Contenedores**: Instalación rápida de contenedores de Docker.
* **Lenguajes y Servidores**: Soporte base para Python, PHP, MySQL y GCC (Compilador GNU de C / C++).
* **Privacidad**: Instalación del servicio de `tor`.

## Cómo usar este repositorio

Para configurar tu sistema desde cero, abre una terminal y ejecuta:

```bash
# 1. Clonar el repositorio
git clone https://github.com/emiliooarrig/mint-setup.git
cd mint-setup/

# 2. Dar permisos de ejecución
chmod +x shell.sh
chmod +x fedora.sh

# 3. Ejecutar la instalación
./shell.sh
./fedora.sh
