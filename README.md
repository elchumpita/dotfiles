# dotfiles

Toda la configuración de mi PC en un solo repo versionado.
Cada carpeta de `config/` corresponde a `~/.config/<app>`.

| App       | Qué es                     |
|-----------|----------------------------|
| awesome   | gestor de ventanas         |
| qtile     | gestor de ventanas         |
| nvim      | editor (Lua + packer)      |
| ranger    | gestor de archivos (TUI)   |
| pcmanfm   | gestor de archivos (GUI)   |
| neofetch  | info del sistema           |

## Instalar en un PC nuevo

```bash
git clone https://github.com/elchumpita/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh -n   # ver qué va a hacer
./install.sh      # enlazar todo
```

`install.sh` crea symlinks `~/.config/<app> -> ~/dotfiles/config/<app>`.
Si ya tenías una config, la mueve a `~/.dotfiles-backup/<fecha>/` (no borra nada).
Instalar sólo algunas: `./install.sh nvim ranger`. Desinstalar: `./install.sh -u`.

## Flujo diario

Como `~/.config/<app>` es un enlace al repo, cualquier cambio que hagas ya está en git:

```bash
cd ~/dotfiles && git add -A && git commit -m "cambio X" && git push
```

## Añadir una app nueva

```bash
mv ~/.config/<app> ~/dotfiles/config/<app>
cd ~/dotfiles && ./install.sh <app>
```

## Notas

- `packer_compiled.lua` lo regenera nvim con `:PackerCompile`; no se versiona.
- Los bookmarks de ranger son locales de cada máquina; no se versionan.
