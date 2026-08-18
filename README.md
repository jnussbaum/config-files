# README

This repo serves as backup for my various config files (e.g. tmux, nvim, zsh, ...).

The files are embedded into this repo as hardlinks, e.g.

```bash
ln ~/.tmux.conf files/tmux.conf 
ln ~/.config/nvim/init.lua files/nvim_chad_init.lua
ln ~/.zshrc files/zshrc
ln ~/.claude/CLAUDE.md files/claude/CLAUDE.md
```

Instead of manually creating the hardlinks,
it would also be possible to use a tool like [GNU Stow](https://www.gnu.org/software/stow/).

Whole directories can't be hardlinked (a hardlink binds one specific file, not a
directory listing), so any folder that should auto-pick-up files added later — e.g.
`~/.claude/tech-preferences` — is moved into this repo and replaced with a symlink
pointing back into `files/`, instead of hardlinking each file inside it individually:

```bash
mv ~/.claude/tech-preferences files/claude/tech-preferences
ln -s "$(pwd)/files/claude/tech-preferences" ~/.claude/tech-preferences
```
