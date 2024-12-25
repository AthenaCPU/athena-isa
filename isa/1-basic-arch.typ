#import "@preview/bytefield:0.0.6" as bytefield

= Basic Architecture

== Addressing

The basic addressable unit is the 8-bit byte. Virtual addresses are 32-bits long.

== Data Type

=== Unsigned Integer

==== Byte

#bytefield.bytefield(
	bpr: 8,
	bytefield.bitheader("bytes"),
	bytefield.bytes(1)[],
)

==== Halfword

#bytefield.bytefield(
	bpr: 16,
	bytefield.bitheader("bytes"),
	bytefield.bytes(2)[],
)

==== Word

#bytefield.bytefield(
	bpr: 32,
	bytefield.bitheader("bytes"),
	bytefield.bytes(4)[],
)

=== Signed Integer

==== Signed byte

#bytefield.bytefield(
	bpr: 8,
	bytefield.bitheader("bytes"),
	bytefield.bits(7)[],
	bytefield.flag[Sign],
)

==== Signed halfword

#bytefield.bytefield(
	bpr: 16,
	bytefield.bitheader("bytes"),
	bytefield.bits(15)[],
	bytefield.flag[Sign],
)

==== Signed word

#bytefield.bytefield(
	bpr: 32,
	bytefield.bitheader("bytes"),
	bytefield.bits(31)[],
	bytefield.flag[Sign],
)

== CPU Registers

An Athena processor includes two types of registers: general purpose registers (GPR) and control/status registers (CRS). 

=== General Purpose Registers

#table(
	columns: 3,
	table.header(
		table.cell(colspan: 3, [*General Purpose Registers*]),
		[*Name*], [*Alternate Name*], [*Comment*]
	),
	[r0], [zero], [Hardwired zero],
  [r1 - r8], [a0 - a7], [Function arguments],
  [r9 - r10], [v0 - v1], [Return value],
  [r11 - r17], [s0 - s6], [Saved register],
  [r18 - r24], [t0 - t6], [Temporary register],
  [r26 - r27], [k0 - k1], [Reserved for kernel],
  [r27], [at], [Reserved for Assembler],
  [r28], [sp], [Stack Pointer],
  [r29], [gp], [Global Pointer],
  [r30], [fp], [Frame Pointer],
  [r31], [ra], [Return address]
)

=== Control and Status Registers

#table(
	columns: 5,
	table.header(
		table.cell(colspan: 5, [*Special Registers*]),
		[*N°*], [*Name*], [*Read*], [*Write*], [*Description*]
	),
	table.cell(colspan: 5, [Unprivileged Registers]),
	table.cell(colspan: 5, [Supervisor Registers]),
	table.cell(colspan: 5, [Machine Registers]),
	[0], [isa], [#emoji.checkmark], [#emoji.crossmark], [Machine ISA Register],
	[1], [status], [#emoji.checkmark], [#emoji.checkmark], [Status Register],
	[2], [cause], [#emoji.checkmark], [#emoji.crossmark], [Cause Register],
	[3], [trapvec], [#emoji.crossmark], [#emoji.checkmark], [Trap Vector Base Address Register],
	[4], [prid], [#emoji.checkmark], [#emoji.crossmark], [Processor Identification],
	[5], [epc], [#emoji.crossmark], [#emoji.crossmark], [Exception Program Counter],
	[6], [pc], [#emoji.crossmark], [#emoji.crossmark], [Program Counter],
)

==== Machine ISA Register

#bytefield.bytefield(
	bpr: 32,
	bytefield.bitheader("bytes"),
	bytefield.bits(31)[-],
	bytefield.bits(1)[F],
)

- F: Single-Precision Floating-Point Extension
- C: Cryptography Extension

==== Status Register

#bytefield.bytefield(
	bytefield.bitheader("bytes"),
	bytefield.bits(4)[impl],
	bytefield.bits(4)[vers],
	bytefield.bits(20)[-],
	bytefield.bits(1)[ET],
	bytefield.bits(1)[P],
	bytefield.bits(1)[S],
)

- S: supervisor mode (1: supervisor, 0: user mode)
- P: paging (1: enabled, 0: disabled)
- ET: enable traps (1: enabled, 0: disabled) 

==== Trap Vector Base Address Regiter

#bytefield.bytefield(
	bytefield.bitheader("bytes"),
	bytefield.bits(31)[base],
	bytefield.bits(1)[M],
)

==== Processor Id


#bytefield.bytefield(
	bytefield.bitheader("bytes"),
	bytefield.bits(31)[base],
	bytefield.bits(1)[M],
)

==== EPC

==== Program Counter