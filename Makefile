all: loop
AS_ARGS=-g
BINDIR=bin
OBJDIR=obj


loop:	loop.s
	mkdir -p ${BINDIR} ${OBJDIR}
	as ${AS_ARGS} -o ${OBJDIR}/loop.o loop.s
	ld -o ${BINDIR}/loop ${OBJDIR}/loop.o

clean:	
	rm -rf ${BINDIR} ${OBJDIR}

.PHONY: run
run:
	@${BINDIR}/loop

.PHONY: debug
debug:
	gdb ${BINDIR}/loop


