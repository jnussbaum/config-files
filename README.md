# README

This repo serves as backup for my various config files (e.g. tmux, nvim, zsh, ...).

The files are embedded into this repo as hardlinks, e.g.

```bash
ln ~/.tmux.conf files/tmux.conf 
ln ~/.config/nvim/init.lua files/nvim_chad_init.lua
ln ~/.zshrc files/zshrc
```

Instead of manually creating the hardlinks,
it would also be possible to use a tool like [GNU Stow](https://www.gnu.org/software/stow/).
