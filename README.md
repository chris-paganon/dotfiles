# Dotfiles for i3+Xfce desktop

## Dependencies:

- install GNU stow: `pacman -S stow`

## Usage:

- Create a directory (`dotfiles`) in `/home/my-user`.
- Remove or rename existing conflicting dotfiles from existing home.
- Run `stow .` to create symlinks of all the files in this directory into parent folder (`home/my-user`) while leaving other dotfiles unaffected. 