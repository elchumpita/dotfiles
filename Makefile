.PHONY: install dry-run uninstall
install:   ; ./install.sh
dry-run:   ; ./install.sh -n
uninstall: ; ./install.sh -u
