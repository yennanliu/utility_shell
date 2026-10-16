# CLI profile — Mac M4 Air (iTerm2 "profile 1")

oh-my-zsh **agnoster** theme + iTerm2 **Molokai** colour preset + **MesloLGS Nerd Font Mono 17**,
after <https://catalins.tech/improve-mac-terminal/>.

```text
 jliu ▶ ~/CS_basics ▶  master ▶
```

| File | What |
|---|---|
| `.zshrc` | `ZSH_THEME="agnoster"`, plus `prompt_context()` at the bottom so the first segment shows only `$USER` (no `@host`) |
| `iterm2_profile_1.json` | the iTerm2 profile (font, colours, window) |
| `Molokai.itermcolors` | the colour preset, from [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) |

## Set up on a new Mac

```bash
# 1. oh-my-zsh + plugins used in .zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 2. font (has the powerline arrows and the branch icon)
brew install --cask font-meslo-lg-nerd-font

# 3. shell config
cp .zshrc ~/.zshrc && exec zsh
```

4. iTerm2 → Settings → Profiles → **Other Actions… → Import JSON Profiles…** → `iterm2_profile_1.json`
   (or: Colors → Color Presets… → Import… → `Molokai.itermcolors`, and Text → Font → **MesloLGS Nerd Font Mono**).

`?` boxes in the prompt mean the profile's font is not a Nerd Font.
