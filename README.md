# LINUX DEV SETUP

CURRENT SYSTEM - UBUNTU | GNOME

## SYSTEM SETTINGS

- `ctrl + tab` -> switch application

## ZSH

```
sudo apt install zsh
```

##### CHECK VERSION

```
zsh --version
```

##### INITIAL CONFIGURATION

```
zsh
```

##### SET DEFAULT SHELL

```
chsh -s $(which zsh)
```

###### LOG OUT TO SEE CHANGES

## OH MY ZSH

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### INSTALL PLUGIN PACKAGES

```
sudo apt install zsh-autosuggestions zsh-syntax-highlighting
```

##### INSTALL PLUGINS

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

```
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

```
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
```

## OH MY POSH

```
curl -s https://ohmyposh.dev/install.sh | bash -s
```

## WEZTERM

```
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
```

```
sudo apt update
```

```
sudo apt install wezterm
```

## GNOME SHELL EXTENSIONS

```
sudo apt install gnome-shell-extensions
```

```
sudo apt install gnome-shell-extension-manager
```

##### CURRENT EXTENSIONS

- https://extensions.gnome.org/extension/3843/just-perfection/
- https://extensions.gnome.org/extension/3628/arcmenu/

## GNOME TWEAKS

```
sudo apt install gnome-tweaks
```

##### KEYBOARD SETTINGS

- `ctrl` <-> `alt`
- `capslock` disable

## CONFIGURATION

##### INSIDE REPOSITORY RUN

```
cp zshrc ~/.zshrc
```

```
cp nile.omp.json ~/.nile.omp.json
```

```
cp wezterm.lua ~/.wezterm.lua
```

```
dconf load /org/gnome/shell/extensions/ < gnome-shell-extensions.conf
```
