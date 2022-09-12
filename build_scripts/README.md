# the build scripts
 can be run in 2 modes secuential with assending numbers

 or paralell:

## paralell:

jobs dependencies:

00 ----> 02 --> 05 --> 07 --> 09
    \       X                    \
     --> 01 --> 04 ----------------> combine   
           \               /
            --> 06 --> 08 -

00: patching sources and prepare licenses
01: zlib + libedit (incl ncurses) + openmp (+ libgfortran)
02: cmake  + libeigen
04: gloinos dependensies - back end
05+07+09: xyce and dependencies - sim
06: tcl and abc+yosys - front end
08: guis: tk, magic and irsim -gui