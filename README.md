# Dotfiles de Jose Carranza

## 1. WSL
### 1.1 Descripción
Configuración de Windows Subsystem for Linux (WSL) para desarrollar en un entorno Linux dentro de Windows.

### 1.2 Enlace de descarga
- [Documentación oficial de WSL](https://docs.microsoft.com/en-us/windows/wsl/)

### 1.3 Instrucciones
#### 1.3.1 Desinstalar una distro existente
```bash
wsl --unregister <DistroName>
```
#### 1.3.2 Instalar WSL
```bash
wsl --install
```
#### 1.3.3 Cambiar a la versión 2
```bash
wsl --set-version <DistroName> 2
```
#### 1.3.4 Crear usuario (jcarranzs)
Configura un nuevo usuario al iniciar la distro.

#### 1.3.5 Actualizar la distro
```bash
sudo apt update && sudo apt upgrade -y
```
#### 1.3.6 Instalar herramientas esenciales
```bash
sudo apt install build-essential -y
```

---

## 2. Descargar fuentes
### 2.1 Descripción
Uso de NerdFonts para símbolos y mejor visualización.

### 2.2 Enlace de descarga
- [Nerd Fonts](https://www.nerdfonts.com/)

---

## 3. Descarga de Wezterm
### 3.1 Descripción
WezTerm es un emulador de terminal moderno y flexible.

### 3.2 Enlace de descarga oficial (Windows)
- [WezTerm](https://wezfurlong.org/wezterm/)

### 3.3 Copiar configuraciones
Copia el archivo de configuración:
```bash
cp .wezterm.lua ~/.wezterm.lua
```

---

## 4. Instalaciones necesarias

### 4.1 Instalación de brew (en Linux/Ubuntu)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4.2 Agregar brew al PATH
```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
```

### 4.3 Instalar fish
#### 4.3.1 Instalar fish con brew
```bash
brew install fish
```
#### 4.3.2 Verificar ruta de fish
```bash
which fish
```
#### 4.3.3 Agregar fish a shells
```bash
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```
#### 4.3.4 Cambiar fish como shell predeterminada
```bash
chsh -s /usr/local/bin/fish
```
#### 4.3.5 Agregar brew al path de fish
```fish
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
```

### 4.4 Configuraciones de fish
#### 4.4.1 Instalar gestor de plugins (Fisher)
```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```
#### 4.4.2 Instalar plugin `jorgebucaran/nvm.fish`
```bash
fisher install jorgebucaran/nvm.fish
```
#### 4.4.3 Instalar plugin `jethrokuan/z`
```bash
fisher install jethrokuan/z
```
#### 4.4.4 Instalar plugin `IlanCosman/tide@v5`
```bash
fisher install IlanCosman/tide@v5
```

---

## 5. Instalaciones con brew

### 5.1 Git
#### 5.1.1 Descripción
Sistema de control de versiones distribuido.
#### 5.1.2 Comando
```bash
brew install git
```

### 5.2 Lazygit
#### 5.2.1 Descripción
Interfaz de usuario simplificada para Git.
#### 5.2.2 Comando
```bash
brew install lazygit
```

### 5.3 GCC
#### 5.3.1 Descripción
Compilador de C/C++.
#### 5.3.2 Comando
```bash
brew install gcc
```

### 5.4 fzf
#### 5.4.1 Descripción
Buscador difuso para la terminal.
#### 5.4.2 Comando
```bash
brew install fzf
```

### 5.5 eza
#### 5.5.1 Descripción
Mejora el comando `ls` con colores y estilos modernos.
#### 5.5.2 Comando
```bash
brew install eza
```

### 5.6 lsd
#### 5.6.1 Descripción
Otro reemplazo moderno para `ls`.
#### 5.6.2 Comando
```bash
brew install lsd
```

### 5.7 Maven
#### 5.7.1 Descripción
Herramienta para la gestión de proyectos Java.
#### 5.7.2 Comando
```bash
brew install maven
```

### 5.8 OpenJDK
#### 5.8.1 Descripción
Kit de desarrollo para Java.
#### 5.8.2 Comando
```bash
brew install openjdk
```

### 5.9 ripgrep
#### 5.9.1 Descripción
Buscador de texto rápido y eficiente.
#### 5.9.2 Comando
```bash
brew install ripgrep
```

### 5.10 fd
#### 5.10.1 Descripción
Alternativa a `find` con mejor rendimiento.
#### 5.10.2 Comando
```bash
brew install fd
```

### 5.11 MySQL
#### 5.11.1 Descripción
Sistema de gestión de bases de datos relacionales.
#### 5.11.2 Comando
```bash
brew install mysql
```

### 5.12 Neovim
#### 5.12.1 Descripción
Editor de texto moderno basado en Vim.
#### 5.12.2 Comando
```bash
brew install neovim
```
