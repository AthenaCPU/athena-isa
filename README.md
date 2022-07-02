```
    Copyright (C)  2022  d0p1.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is included in 'LICENSE' file
```

# Athena instruction set

Instruction are 32bit and big-endian.

There is two CPU mode:
- Supervisor mode (kernel space)
- unprivileged (userspace)

## Register

| name | special name | encoding | comment         |
|------|--------------|----------|-----------------|
| r0   | zero         | 00000    | hardwired zero  |
| r1   | a0           | 00001    | func arg 0      |
| r2   | a1           | 00010    | func arg 1      |
| r3   | a2           | 00011    | func arg 2      |
| r4   | a3           | 00100    | func arg 3      |
| r5   | a4           | 00101    | func arg 4      |
| r6   | a5           | 00110    | func arg 5      |
| r7   | a6           | 00111    | func arg 6      |
| r8   | a7           | 01000    | func arg 7      |
| r9   |              | 01001    |                 |
| r10  |              | 01010    |                 |
| r11  |              | 01011    |                 |
| r12  |              | 01100    |                 |
| r13  |              | 01101    |                 |
| r14  |              | 01110    |                 |
| r15  |              | 01111    |                 |
| r16  |              | 10000    |                 |
| r17  |              | 10001    |                 |
| r18  |              | 10010    |                 |
| r19  |              | 10011    |                 |
| r20  |              | 10100    |                 |
| r21  |              | 10101    |                 |
| r22  |              | 10110    |                 |
| r23  |              | 10111    |                 |
| r24  |              | 11000    |                 |
| r25  |              | 11001    |                 |
| r26  | k0           | 11010    | reserved kernel |
| r27  | k1           | 11011    | reserved kernel |
| r28  | sp           | 11100    | stack pointer   |
| r29  | gp           | 11101    | global pointer  |
| r30  | fp           | 11110    | frame pointer   |
| r31  | ra           | 11111    | return address  |

## Special Registers

| register | read | write | comment               |
|----------|------|-------|-----------------------|
| 0        | ✔️   | ✔️   | Status                |
| 1        | ✔️   | ✔️   | interrupt vector addr |
| 2        | ❌   | ❌   | EPC                   |

### Status

| 0-1             | 2-3           | 4-31 |
|-----------------|---------------|------|
| supervisor mode | paging enable |      |

## Interrupt Vector

| Exception Type      | Offset |
|---------------------|--------|
| Reset               | 0x0    |
| External Int        | 0x1    |
| Invalid instruction | 0x2    |
| Arithmetic overflow | 0x3    |
| Syscall             | 0x4    |

## Memory

Memory is byte-addressable up to 4GB (using 32bit address).
Data can by accessed 8 (Byte), 16 (Half Word), 32 (Word).

## Instruction encoding

### R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31 |
|--------|------|-------|-------|-------|-------|
| opcode | ra   | rb    | rc    | shamt | func  |

### I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| opcode | ra   | rb    | imm   |

### J-format

| 0-5    | 6-10 | 11-31   |
|--------|------|---------|
| opcode | ra   | offset  |

### L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| opcode | ra   | rb    | width | offset  |

## Opcode list

| name    | opcode | func   |
|---------|--------|--------|
| add     | 000000 | 000001 |
| addu    | 000000 | 000010 |
| addi    | 000001 | -      |
| addiu   | 000010 | -      |
| and     | 000000 | 000101 |
| andi    | 000101 | -      |
| beq     | 001110 | -      |
| bne     | 001111 | -      |
| blt     | 010000 | -      |
| bgt     | 010001 | -      |
| call    | 001101 | -      |
| csrr    | 111111 | 111110 |
| csrw    | 111111 | 111111 |
| div     | 000000 | 000110 |
| divu    | 000000 | 000111 |
| eret    | 111111 | 000001 |
| jmp     | 001010 | -      |
| lih     | 001011 | -      |
| loadu   | 001100 | -      |
| load    | 001001 | -      |
| mult    | 000000 | 001000 |
| multu   | 000000 | 001001 |
| nor     | 000000 | 001010 |
| nop     | 000000 | 000000 |
| or      | 000000 | 001011 |
| ori     | 000110 | -      |
| sll     | 000000 | 001101 |
| sllr    | 000000 | 010000 |
| sra     | 000000 | 001111 |
| srar    | 000000 | 010001 |
| srl     | 000000 | 001110 |
| srlr    | 000000 | 010010 |
| store   | 001000 | -      |
| sub     | 000000 | 000011 |
| subu    | 000000 | 000100 |
| subi    | 000011 | -      |
| subiu   | 000100 | -      |
| ecall   | 000000 | 111111 |
| xor     | 000000 | 001100 |
| xori    | 000111 | -      |

## Instruction

### add

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000001 |

```pascal
ra := rb + rc;
```

### addu

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000010 |

```pascal
ra := rb + rc;
```

### addi

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000001 | ra   | rb    | imm   |

```pascal
ra := rb + imm;
```

### addiu

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000010 | ra   | rb    | imm   |

```pascal
ra := rb + imm;
```

### and

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000101 |

```pascal
ra := rb AND rc;
```

### andi

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000101 | ra   | rb    | imm   |

```pascal
ra := rb AND imm;
```

### b

I-format

| 0-5    | 6-10  | 11-15 | 16-31  |
|--------|-------|-------|--------|
| 001110 | 00000 | 00000 | offset |

```pascal
$PC += offset * 4; 
```

### beq

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 001110 | ra   | rb    | offset |

```pascal
IF ra = rb THEN
BEGIN
	$PC += offset * 4;
END;
```

### beqz

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 001110 | ra   | 00000 | offset |

```pascal
IF ra = 0x0 THEN
BEGIN
	$PC += offset * 4;
END;
```

### bne

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 001111 | ra   | rb    | offset |

```pascal
IF ra <> rb THEN
BEGIN
	$PC += offset * 4;
END;
```

### bnez

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 001111 | ra   | 00000 | offset |

```pascal
IF ra <> 0x0 THEN
BEGIN
	$PC += offset * 4;
END;
```

### blt

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 010000 | ra   | rb    | offset |

```pascal
IF ra < rb THEN
BEGIN
	$PC += offset * 4;
END;
```

### bltz

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 010000 | ra   | 00000 | offset |

```pascal
IF ra < 0x0 THEN
BEGIN
	$PC += offset * 4;
END;
```

### bgt

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 010001 | ra   | rb    | offset |

```pascal
IF ra > rb THEN
BEGIN
	$PC += offset * 4;
END;
```

### bgtz

I-format

| 0-5    | 6-10 | 11-15 | 16-31  |
|--------|------|-------|--------|
| 010001 | ra   | 00000 | offset |

```pascal
IF ra > 0x0 THEN
BEGIN
	$PC += offset * 4;
END;
```

### call

J-format

| 0-5    | 6-10 | 11-31   |
|--------|------|---------|
| 001101 | ra   | offset  |

```pascal
$RA := $PC + 4;
$PC := ra + (offset * 4);
```

### div

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000110 |

```pascal
ra := rb / rc;
```

### divu

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000111 |

```pascal
ra := r1 / r2;
```

### jmp

J-format

| 0-5    | 6-10 | 11-31   |
|--------|------|---------|
| 001010 | ra   | offset  |

```pascal
$PC := ra + (offset * 4);
```

### la

Pseudo instruction
```asm
	la a0, 0xDEADBEEF
```
transpile to:
```asm
	ori a0, zero, 0xBEEF
	lih a0, 0xDEAD
```

### lb

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001001 | ra   | rb    | 00    | offset  |

Loads a 8bit value from memory then sign extended to 32bit before storing to `ra`

```c
ra = *(int8_t)(rb + offset);
```

### lbu

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001100 | ra   | rb    | 00    | offset  |

Loads a 8bit value from memory then zero extended to 32bit before storing to `ra`

```c
ra = *(uint8_t)(rb + offset);
```

### lh

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001001 | ra   | rb    | 01    | offset  |

Loads a 16bit value from memory then sign extended to 32bit before storing to `ra`

```c
ra = *(int16_t)(rb + offset);
```

### lhu

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001100 | ra   | rb    | 01    | offset  |

Loads a 16bit value from memory then zero extended to 32bit before storing to `ra`

```c
ra = *(uint16_t)(rb + offset);
```

### lw

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001001 | ra   | rb    | 10    | offset  |

Loads a 32bit value from memory then store to `ra`

```c
ra = *(uint8_t)(rb + offset);
```

### lih

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 001011 | ra   | -     | imm   |

```pascal
ra := (ra AND (NOT (0xFFFF SHL 16))) | imm SHL 16;
```

### mult

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 001000 |

```pascal
ra := rb * rc;
```

### multu

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 001001 |

```pascal
ra := rb * rc;
```

### nor

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 001010 |

```pascal
ra := NOT (rb OR rc);
```

### or

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 001011 |

```pascal
ra := rb OR rc;
```

### ori

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000110 | ra   | rb    | imm   |

```pascal
ra := rb OR imm;
```

### nop

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | -    | -     | -     | -     | 000000 |

NO-OP, just waste one cycle

### sll

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | -     | shmat | 001101 |

Shift left logical

```c
```

### sllr

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | -     | 010000 |

Shift left logical

```c
```

### sra

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | -     | shmat | 001110 |

Shift right arithmetic

```c
```

### srar

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | -     | 010001 |

Shift right arithmetic

```c
```

### srl

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | -     | shmat | 001110 |

Shift right logical

### srlr

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | -     | 010010 |

Shift right logical

### sb

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001000 | ra   | rb    | 00    | offset  |

Store the 8bit value from the low bits of register `rb` into memory

```c
*(int8_t *)(offset + ra) = rb;
```

### sh

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001000 | ra   | rb    | 01    | offset  |

Store the 16bit value from the low bits of register `rb` into memory

```c
*(int16_t *)(offset + ra) = rb;
```

### sw

L/S-format

| 0-5    | 6-10 | 11-15 | 16-17 | 18-31   |
|--------|------|-------|-------|---------|
| 001000 | ra   | rb    | 10    | offset  |

Store the 32bit value from the low bits of register `rb` into memory

```c
*(int32_t *)(ra + offset) =  rb;
```

### sub

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000011 |

```pascal
ra := rb - rc
```

### subu

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 000100 |

```pascal
ra := rb - rc
```

### subi

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000011 | ra   | rb    | imm   |

```pascal
ra := rb - imm
```

### subiu

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000100 | ra   | rb    | imm   |

```pascal
ra := rb - imm
```

### ecall

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | -    | -     | -     | -     | 111111 |

```pascal
$EPC := $PC + 4
$PC := int_vector(syscall)
```

### xor

R-format

| 0-5    | 6-10 | 11-15 | 16-20 | 21-25 | 26-31  |
|--------|------|-------|-------|-------|--------|
| 000000 | ra   | rb    | rc    | 00000 | 001100 |

```pascal
ra := rb XOR rc
```

### xori

I-format

| 0-5    | 6-10 | 11-15 | 16-31 |
|--------|------|-------|-------|
| 000111 | ra   | rb    | imm   |

```pascal
ra := rb XOR imm
```

# Athena FPU

## Registers

| name | encoding |
|------|----------|
| f0   | 00000    |
| f1   | 00001    |
| f2   | 00010    |
| f3   | 00011    |
| f4   | 00100    |
| f5   | 00101    |
| f6   | 00110    |
| f7   | 00111    |
| f8   | 01000    |
| f9   | 01001    |
| f10  | 01010    |
| f11  | 01011    |
| f12  | 01100    |
| f13  | 01101    |
| f14  | 01110    |
| f15  | 01111    |
| f16  | 10000    |
| f17  | 10001    |
| f18  | 10010    |
| f19  | 10011    |
| f20  | 10100    |
| f21  | 10101    |
| f22  | 10110    |
| f23  | 10111    |
| f24  | 11000    |
| f25  | 11001    |
| f26  | 11010    |
| f27  | 11011    |
| f28  | 11100    |
| f29  | 11101    |
| f30  | 11110    |
| f31  | 11111    |