#import "../../common/instruction-format.typ": format_immediate

=== ANDI

#format_immediate(
  opcode: [*000011*],
)

*Format*: ANDI ra, rb, imm

*Purpose*: Bitwise logical AND with a constant

```c
  GPR[ra] = GPR[rb] & ZEXT(imm)
```