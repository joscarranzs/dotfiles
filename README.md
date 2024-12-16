# Dotfiles de Jose Carranza

## WSL
### Descripción
Configuración de Windows Subsystem for Linux (WSL) para desarrollar en un entorno Linux dentro de Windows.

### Enlace de descarga
- [Documentación oficial de WSL](https://docs.microsoft.com/en-us/windows/wsl/)

### Instrucciones
#### Desinstalar una distro existente
```bash
wsl --unregister <DistroName>
```
#### Instalar WSL
```bash
wsl --install
```
#### Cambiar a la versión 2
```bash
wsl --set-version <DistroName> 2
```
#### Crear usuario (jcarranzs)
Configura un nuevo usuario al iniciar la distro.

#### Actualizar la distro
```bash
sudo apt update && sudo apt upgrade -y
```
#### Instalar herramientas esenciales
```bash
sudo apt install build-essential -y
```

---

## Descargar fuentes
### Descripción
Uso de NerdFonts para símbolos y mejor visualización.

### Enlace de descarga
- [Nerd Fonts](https://www.nerdfonts.com/)

---

## Descarga de Wezterm
### Descripción
WezTerm es un emulador de terminal moderno y flexible.

### Enlace de descarga oficial (Windows)
- [WezTerm](https://wezfurlong.org/wezterm/)

### Copiar configuraciones
Copia el archivo de configuración:
```bash
cp .wezterm.lua ~/.wezterm.lua
```

---

## Instalaciones necesarias

### Instalación de brew (en Linux/Ubuntu)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Agregar brew al PATH
```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
```

### Instalar fish
#### Instalar fish con brew
```bash
brew install fish
```
#### Verificar ruta de fish
```bash
which fish
```
#### Agregar fish a shells
```bash
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```
#### Cambiar fish como shell predeterminada
```bash
chsh -s /usr/local/bin/fish
```
#### Agregar brew al path de fish
```fish
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
```

### Configuraciones de fish
#### Instalar gestor de plugins (Fisher)
```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```
#### Instalar plugin `jorgebucaran/nvm.fish`
```bash
fisher install jorgebucaran/nvm.fish
```
#### Instalar plugin `jethrokuan/z`
```bash
fisher install jethrokuan/z
```
#### Instalar plugin `IlanCosman/tide@v5`
```bash
fisher install IlanCosman/tide@v5
```

---

## Instalaciones con brew

### Git
#### Descripción
Sistema de control de versiones distribuido.
#### Comando
```bash
brew install git
```

### Lazygit
#### Descripción
Interfaz de usuario simplificada para Git.
#### Comando
```bash
brew install lazygit
```

### GCC
#### Descripción
Compilador de C/C++.
#### Comando
```bash
brew install gcc
```

### fzf
#### Descripción
Buscador difuso para la terminal.
#### Comando
```bash
brew install fzf
```

### eza
#### Descripción
Mejora el comando `ls` con colores y estilos modernos.
#### Comando
```bash
brew install eza
```

### lsd
#### Descripción
Otro reemplazo moderno para `ls`.
#### Comando
```bash
brew install lsd
```

### Maven
#### Descripción
Herramienta para la gestión de proyectos Java.
#### Comando
```bash
brew install maven
```

### OpenJDK
#### Descripción
Kit de desarrollo para Java.
#### Comando
```bash
brew install openjdk
```

### ripgrep
#### Descripción
Buscador de texto rápido y eficiente.
#### Comando
```bash
brew install ripgrep
```

### fd
#### Descripción
Alternativa a `find` con mejor rendimiento.
#### Comando
```bash
brew install fd
```

### MySQL
#### Descripción
Sistema de gestión de bases de datos relacionales.
#### Comando
```bash
brew install mysql
```

### Neovim
#### Descripción
Editor de texto moderno basado en Vim.
#### Comando
```bash
brew install neovim
```
