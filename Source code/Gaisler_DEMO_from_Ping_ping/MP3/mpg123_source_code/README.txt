This folder contains MPG123 source code, modified C codes in data folder 
and Makefile which creates mpg123.exe file

#	make mp3raw-noidct: Decoded audio data is stored at 0x42000000 and hardware accelarator is not used.

-------------------------------------------------------------------------------------------------------

Precompiled folder contains executable mpg123 files of all options.

-------------------------------------------------------------------------------------------------------
RE-INITIALIZATION

You can re-initialize mpg123 library by extracting zipped file and typing "make reinit" .

Instead of "make reinit", you can;
-->Type following commands to configure mpg123 source code in library folder ( ./mpg123-1.13.3).
	export CC=sparc-rtems-gcc
	export CXX=sparc-rtems-gcc
	export CFLAGS='-msoft-float -g -mcpu=v8'
	./configure --target=sparc-rtems --host=sparc-rtems --disable-shared --with-cpu=generic_nofpu 
	cp ./data/compat.c ./mpg123-1.13.3/src/libmpg123

-------------------------------------------------------------------------------------------------------
MP3 to SREC
You can convert MP3 files to SREC format by following command;
	./bin2srec -o 40800000 -a 4 -l 16 [input mp3 file] > [output srec file]
EX:
	./bin2srec -o 40800000 -a 4 -l 16 PapaRoach-Forever.mp3 >PapaRoachmp3.srec

Notes:
0x40800000 is defined as starting address in compat.c. Any change in this address must be applied to compat.c too.

