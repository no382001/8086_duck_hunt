% : %.asm
	rm *.COM; dosbox -c "nasm -f bin -o $@.com $<"