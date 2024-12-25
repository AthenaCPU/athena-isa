#import "@preview/bytefield:0.0.6": *

#let format_reg(opcode: "opcode", ra: "ra", rb: "rb", rc: "rc", shmat: "shmat", function: "function") = {
  bytefield(
    bitheader("bytes"),
    bits(6)[ #opcode ],
    bits(5)[ #ra ],
    bits(5)[ #rb ],
    bits(5)[ #rc ],
    bits(5)[ #shmat ],
    bits(6)[ #function ],
  )
}

#let format_immediate(opcode: "opcode", ra: "ra", rb: "rb", immediate:  "immediate") = {
  bytefield(
    bitheader("bytes"),
    bits(6)[ #opcode ],
    bits(5)[ #ra ],
    bits(5)[ #rb ],
    bits(16)[ #immediate ],
  )
}

#let format_jump(opcode: "opcode", ra: "ra", offset: "offset") = {
  bytefield(
    bitheader("bytes"),
    bits(6)[ #opcode ],
    bits(5)[ #ra ],
    bits(21)[ #offset ],
  )
}

#let format_load_store(opcode: "opcode", ra: "ra", rb: "rb", width: "width", offset: "offset") = {
  bytefield(
    bitheader("bytes"),
    bits(6)[ #opcode ],
    bits(5)[ #ra ],
    bits(5)[ #rb ],
    bits(2)[ #width ],
    bits(14)[ #offset ],
  )
}
