= Introduction

Athena is a new load/store RISC architecture inspired by MIPS, SPARC, RISC-V and designed for fun.

This manual also enforce ABI which may change with ISA revision.

== Conventions

=== Numbering

All numbers are decimal or hexadecimal unless orthewise indicated.
Hexadecimal number start with the prefix 0x.

=== Notations

#table(
	columns: 2,
	[SEXT(x)], [x is sign-extended],
	[ZEXT(x)], [x is zero-extended],
)

== Operating Mode

Athena requires at last two operating modes which are Supervisor Mode and User Mode

#table(
	columns: 4,
	table.header(
		[*Level*], [*Encoding*], [*Name*], [*Abbrev*]
	),
	[0], [00], [User Mode], [U],
	[1], [01], [Supervisor Mode], [S],
	[2], [10], [Reserved], [],
	[3], [11], [Machine], [M],
)

=== Supervisor Mode

The processor enters in Supervisor Mode at power-up.

=== User Mode

TODO
