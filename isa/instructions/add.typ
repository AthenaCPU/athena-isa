#import "../../common/instruction-format.typ": format_reg

=== ADD

#format_reg(
  opcode: [*000000*],
  function: [*000000*],
)

*Format*: `ADD ra, rb, rc`

*Purpose*: Add word.

```c
  GPR[ra] = GPR[rb] + GPR[rc]
```