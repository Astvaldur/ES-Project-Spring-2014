SHELL := /bin/bash
SREC=srec_cat
SREC_OPT = -address-length=4 -line-length=46 -header="Data and Code"

include prefix.inc

.PHONY: ise
ise:
	source ${XILINX_SCRIPT} && cd ./leon3-digilent-nexys4 && make scripts && make ise

.PHONY: vsim-run
vsim-run:
	source ${MOD_SCRIPT} && module add ${VSIM} && cd ./leon3-digilent-nexys4 && make scripts && make vsim-run

.PHONY: vsim-launch
vsim-launch:
	source ${MOD_SCRIPT} && module add ${VSIM} && cd ./leon3-digilent-nexys4 && make scripts && make vsim-launch

.PHONY: prog-fpga
prog-fpga:
	source ${XILINX_SCRIPT} && cd ./leon3-digilent-nexys4 && make ise-prog-fpga

.PHONY: grmon
grmon:
	export PATH=${GRMON}:${PATH} && grmon -eth ${ip} -u

.PHONY: tsim
tsim:
	export PATH=${TSIM}:${PATH} && tsim-leon3 -nosram -nfp

.PHONY: mp3tosrec
mp3tosrec:
	bin/bin2srec -o 40800000 -a 4 -l 16 ${mp3} > mp3.srec
