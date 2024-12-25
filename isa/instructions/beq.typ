#import "../../common/instruction-format.typ": format_immediate

=== BEQ

#format_immediate(
  opcode: [*001011*],
  immediate: [offset],
)

*Format*: BEQ ra, rb, offset

*Purpose*: Compare GPRs then do a PC-relative conditional branch on equal

```c
  if (GPR[ra] == GPR[rb])
  {
    PC += SEXT(offset << 2)
  }
```