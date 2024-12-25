#import "../../common/instruction-format.typ": format_immediate

=== ADDI

#format_immediate(
  opcode: [*000001*],
)

*Format*: ADDI ra, rb, imm

*Purpose*: Add immediate sign-extended.

```c
  GPR[ra] = GPR(rb) + SEXT(imm)
```