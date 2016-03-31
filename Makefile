PREFIX=$(HOME)/.local

install:
	mkdir -p $(PREFIX)/bin
	cp ./kolejka-za.sh $(PREFIX)/bin/kolejka-za
	chmod +x $(PREFIX)/bin/kolejka-za
