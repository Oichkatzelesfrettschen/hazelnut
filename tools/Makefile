# Simple build script for utility programs

all: mktime

mktime: mktime.c
	@gcc -Wall -Werror $< -o $@

clean:
	@rm -f mktime

# Optional utility for inspecting TCB layout
/tmp/dump_tcb: /tmp/dump_tcb.c /tmp/_thread.h /tmp/thread.c
	@gcc -I../kernel/include --save-temps -D__ARCH__=x86 -DASSEMBLY -x c++ -o $@ /tmp/dump_tcb.c
	@$@
	@rm $@ $^
