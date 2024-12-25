= Examples

== Basic operations

=== Simple loop

```asm
	addi r1, r0, 100
loop:
	subi r1, r1, 1
	bnez r1, loop
	nop /* delay slot */
```

=== Hello, World

```asm
	.text
	.globl main
main:
	la a0, msg_str

	.extern puts
	call exit

	.extern exit
	call exit

	.data
msg_str:
	.asciiz "Hello World!"
```

