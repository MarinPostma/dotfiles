
all: install dotfiles

install: packages
	yay -Sy - < packages

dotfiles:
	mkdir -p ~/.config

	ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim
	ln -s ${HOME}/dotfiles/picom ${HOME}/.config/picom
	ln -s ${HOME}/dotfiles/kitty ${HOME}/.config/kitty
	ln -s ${HOME}/dotfiles/.conkyrc ${HOME}/.conkyrc
	ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
	ln -s ${HOME}/dotfiles/.tmux.conf ${HOME}/.tmux.conf
	ln -s ${HOME}/dotfiles/.xmonad ${HOME}/.xmonad

clean:
	rm -rf  ${HOME}/.config/nvim
	rm -rf  ${HOME}/.config/picom
	rm -rf  ${HOME}/.config/kitty
	rm -rf  ${HOME}/.conkyrc
	rm -rf  ${HOME}/.zshrc
	rm -rf  ${HOME}/.tmux.conf
	rm -rf  ${HOME}/.xmonad
