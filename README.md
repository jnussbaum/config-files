# README

This repo serves as backup for my various config files (e.g. tmux, nvim, zsh, ...).

Each file or directory is moved into this repo and replaced at its original
location with a symlink pointing back into `files/`, e.g.

```bash
mv ~/.tmux.conf files/tmux.conf
ln -s "$(pwd)/files/tmux.conf" ~/.tmux.conf

mv ~/.claude/CLAUDE.md files/claude/CLAUDE.md
ln -s "$(pwd)/files/claude/CLAUDE.md" ~/.claude/CLAUDE.md

mv ~/.claude/tech-preferences files/claude/tech-preferences
ln -s "$(pwd)/files/claude/tech-preferences" ~/.claude/tech-preferences
```

A symlink also auto-picks-up files added later inside a linked directory,
since the symlink points at the directory listing itself, not one file.

Earlier versions of this repo used hardlinks (`ln` without `-s`) for
individual files. A hardlink breaks silently whenever the live file is
rewritten by write-a-new-file-then-rename instead of an in-place edit — a
pattern used by many editors and CLI tools — leaving the repo copy stale
with no error. A symlink survives that, since the rename only replaces the
target file's content, not the symlink itself. New files should use the
symlink pattern; most existing files have been converted, except
`~/.config/atuin/config.toml`, which still uses the old hardlink.
