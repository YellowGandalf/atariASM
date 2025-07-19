main:
	mads test.asm -l:tet.lst -o:test.xex

run:
	mads test.asm -l:tet.lst -o:test.xex
	atari800 test.xex



