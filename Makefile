% : %.asm
	dosbox -c "nasm -f bin -o $@.com $<" -c "$@.com"