# This is a bash setup script for Will Buziak's dotfiles repository 

# Check the existence of an ".old_dotfiles" directory
if [ -d ~/.old_dotfiles ]; then
	echo 'Directory: ~/.old_dotfiles/ exists'
else
	mkdir ~/.old_dotfiles 1> /dev/null
  echo "Created ~/.old_dotfiles"

fi
echo ""

# Search for the old dotfiles and move them to a folder
current_date=$(date +"%Y-%m-%d")

if [ -f ~/.old_dotfiles/bashrc ]; then
  # If upload twice in one day, copies are deleted
  file=~/.old_dotfiles/bashrc-$current_date
  if [ -f $file ]; then
    rm $file
  fi
  
  mv ~/.old_dotfiles/bashrc $file
  echo 'Copied and dated the existing bashrc file'
fi

if [ -f ~/.old_dotfiles/zshrc ]; then
  file=~/.old_dotfiles/zshrc-$current_date
  if [ -f $file ]; then
    rm $file
  fi
  
  mv ~/.old_dotfiles/zshrc $file
  echo 'Copied and dated the existing zshrc file'
fi

if [ -f ~/.old_dotfiles/vimrc ]; then
  file=~/.old_dotfiles/vimrc-$current_date
  if [ -f $file ]; then
    rm $file
  fi
  mv ~/.old_dotfiles/vimrc $file
  echo 'Copied and dated the existing vimrc file'
fi

# Move old dotfiles to folder

if [ -f ~/.bashrc ]; then 
	mv ~/.bashrc ~/.old_dotfiles/bashrc
	echo "Moved .bashrc to ~/.old_dotfiles/bashrc"
fi

if [ -f ~/.zshrc ]; then 
	mv ~/.zshrc ~/.old_dotfiles/zshrc
	echo "Moved .zshrc to ~/.old_dotfiles/zshrc"
fi

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.old_dotfiles/vimrc
	echo "Moved .vimrc to ~/.old_dotfiles/vimrc"
fi
echo ""

# Set up hard links
if [ -f bashrc ]; then
	ln ./bashrc ~/.bashrc
fi
if [ -f zshrc ]; then
	ln ./zshrc ~/.zshrc
fi
if [ -f vimrc ]; then
	ln ./vimrc ~/.vimrc
fi

echo "Links created"
echo ""

# Check if bashrc exists, if not, check zsh
if [ -f bashrc ]; then
  source ~/.bashrc
  echo "source ~/.bashrc"
  echo ""
else 
  if [ -f zshrc ]; then
    source ~/.zshrc
    echo "source ~/.zshrc"
    echo ""
  fi
fi

