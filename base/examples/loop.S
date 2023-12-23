	addi r1, r0, 100
loop:
	subi r1, r1, 1
	bnez r1, loop
	nop /* delay slot */
