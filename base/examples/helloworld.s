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

	
