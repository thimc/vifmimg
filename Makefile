install:
	sudo cp ./vifmrun /usr/bin/vifmrun
	sudo chmod +x /usr/bin/vifmrun
	@if [[ ! -d ~/.config/vifm/scripts/ ]]; then\
		mkdir --parents ~/.config/vifm/scripts ;\
	fi
	cp ./vifmimg ~/.config/vifm/scripts/vifmimg
	chmod +x ~/.config/vifm/scripts/vifmimg

uninstall:
	sudo rm /usr/bin/vifmrun
	sudo rm ~/.config/vifm/scripts/vifmimg
