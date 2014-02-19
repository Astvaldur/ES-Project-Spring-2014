#This Makefile is used to create mpg123.exe and sdram.srec file
#
#	make mp3: Decoded audio data is stored at 0x41800000
#
#	make reinit:	Re-initialization of mpg123 library	
#
#	!!!! be sure that sparc-rtems-gcc is added to the PATH.

PATH := /chalmers/sw/unsup64/rtems-4.10/bin:${PATH}
LD_LIBRARY_PATH := /chalmers/sw/unsup64/gmp-5.0.2/lib:/chalmers/sw/unsup64/mpfr-2.4.2/lib:/chalmers/sw/unsup64/rtems-4.10/sparc-rtems/leon3/lib:${LD_LIBRARY_PATH}

.PHONY: clean
clean:
	cd ./mpg123-1.13.3/ && make clean
	rm -f mpg123 sdram.srec

.PHONY: mp3
mp3:   mp3raw compile exe srec

.PHONY: compile
compile:
	export PATH=${PATH} && export LD_LIBRARY_PATH=${LD_LIBRARY_PATH} && cd ./mpg123-1.13.3 && make

.PHONY: exe
exe:
	cp ./mpg123-1.13.3/src/mpg123 ./

.PHONY: srec
srec:
	sparc-rtems-objcopy -O srec mpg123 ram.srec

.PHONY: mp3raw
mp3raw:
	cp ./data/dct64.c ./mpg123-1.13.3/src/libmpg123
	cp ./data/audio.c ./mpg123-1.13.3/src
	cp ./data/mpg123.c ./mpg123-1.13.3/src
	cp ./data/mpg123app.h ./mpg123-1.13.3/src

reinit:
	cp ./data/compat.c ./mpg123-1.13.3/src/libmpg123
	cp ./data/control_generic.c ./mpg123-1.13.3/src/libmpg123
	cd ./mpg123-1.13.3 && export PATH=${PATH} && export LD_LIBRARY_PATH=${LD_LIBRARY_PATH} && export CC=sparc-rtems-gcc && export CXX=sparc-rtems-gcc && export CFLAGS='-msoft-float -g -mcpu=v8' && ./configure --target=sparc-rtems --host=sparc-rtems --disable-shared --with-cpu=generic_nofpu --with-default-audio=dummy
