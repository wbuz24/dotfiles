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

if [ -f ~/.old_dotfiles/bashrc ]; then
  current_date=$(date +"%Y-%m-%d")
  file=~/.old_dotfiles/bashrc-$current_date
  if [ -f $file ]; then
    rm $file
  fi
  
  mv ~/.old_dotfiles/bashrc $file
  echo 'Copied and dated the existing bashrc file'
fi

if [ -f ~/.old_dotfiles/vimrc ]; then
  current_date=$(date +"%Y-%m-%d")
  file=~/.old_dotfiles/vimrc-$current_date
  if [ -f $file ]; then
    rm $file
  fi
  mv ~/.old_dotfiles/vimrc $file
  echo 'Copied and dated the existing vimrc file'
fi


if [ -f ~/.bashrc ]; then 
	mv ~/.bashrc ~/.old_dotfiles/bashrc
	echo "Moved .bashrc to ~/.old_dotfiles/bashrc"
fi

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.old_dotfiles/vimrc
	echo "Moved .vimrc to ~/.old_dotfiles/vimrc"
fi
echo ""


if [ -f bashrc ]; then
	ln ./bashrc ~/.bashrc
fi
if [ -f vimrc ]; then
	ln ./vimrc ~/.vimrc
fi

echo "Links created"
echo ""

source ~/.bashrc
