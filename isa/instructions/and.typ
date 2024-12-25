#import "../../common/instruction-format.typ": format_reg

=== AND

#format_reg(
  opcode: [*000000*],
  function: [*000010*],
)

*Format*: AND ra, rb, rc

*Purpose*: Bitwise logical AND

```c
  GPR[ra] = GPR[rb] & GPR[rc]
```