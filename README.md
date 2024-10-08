# Dotfiles repository

For more information on a dotfile repository and why you may be interested in one, I recommend this [webpage](https://geekdude.github.io/tech/dotfiles/) by Dr. Aaron Young.

# Structure

This repository holds my dotfiles and removes the '.' so that they are visible. Therefore, the dot will need to be added to each file.

For setup, this bash script will build an `~/.old_dotfiles/` folder and move things appropriately, this will be a hidden folder, so keep note.
```
sh setup.sh
```

Dependencies:

- bash
- vim

# Saving Scheme

The bash script will ensure that you have `~/.old_dotfiles/` and save the existing config files. If `~/.old_dotfiles/` already exists and has pre-existing files inside of it, it will move the pre-existing files and append the date to the filename.

The script will then create hard links between the repository versions of the config files with the system config files, then when the repository receives updates, it will automatically update your system.

Links should be set properly so long as the setup script is run from the `dotfiles` repository, wherever you placed it.
