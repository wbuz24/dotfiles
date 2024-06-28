# This is a bash setup script for Will Buziak's dotfiles repository 

# Check the existence of an "old_dotfiles" directory
if [ -d ~/old_dotfiles ]; then
	echo 'Directory: bin/ exists' 1> /dev/null
else
	mkdir ~/old_dotfiles 1> /dev/null

fi
echo "Created ~/old_dotfiles"

# make clean, but shove output to /dev/null

if [ -f ~/.bashrc ]; then 
	echo ""
	mv ~/.bashrc ~/old_dotfiles/bashrc
	echo "Moved .bashrc ~/old_dotfiles"
fi

if [ -f ~/.vimrc ]; then
	echo ""
	mv ~/.vimrc ~/old_dotfiles/vimrc
	echo "Moved .vimrc ~/old_dotfiles"
fi


if [ -f bashrc ]; then
	ln ./bashrc ~/.bashrc
fi
if [ -f vimrc ]; then
	ln ./vimrc ~/.vimrc
fi

echo ""
echo "Links created"
echo ""

source ~/.bashrc
