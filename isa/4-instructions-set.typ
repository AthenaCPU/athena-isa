#import "@preview/bytefield:0.0.6" as bytefield
#import "../common/instruction-format.typ": format_reg, format_immediate, format_jump, format_load_store

= The Athena Instruction Set

== Instruction Format

There are 4 basic Athena instruction formats:

- R-Format
- I-Format
- J-Format
- LS-Format

== R-Format

#format_reg()

== I-Format

#format_immediate()

== J-Format

#format_jump()

== L/S-Format

#format_load_store()

== Alphabetical List of Instruction

#include "instructions/add.typ"
#include "instructions/addi.typ"
#include "instructions/and.typ"
#include "instructions/andi.typ"
#include "instructions/beq.typ"
#include "instructions/bne.typ"
#include "instructions/break.typ"
#include "instructions/call.typ"
#include "instructions/div.typ"
#include "instructions/divu.typ"
#include "instructions/jmp.typ"
#include "instructions/lih.typ"
#include "instructions/load.typ"
#include "instructions/loadu.typ"
#include "instructions/mod.typ"
#include "instructions/modu.typ"
#include "instructions/mult.typ"
#include "instructions/multh.typ"
#include "instructions/multhu.typ"
#include "instructions/mvfsr.typ"
#include "instructions/mvtsr.typ"
#include "instructions/nor.typ"
#include "instructions/or.typ"
#include "instructions/ori.typ"
#include "instructions/rfe.typ"
#include "instructions/sll.typ"
#include "instructions/sllr.typ"
#include "instructions/slt.typ"
#include "instructions/slti.typ"
#include "instructions/sltiu.typ"
#include "instructions/sltu.typ"
#include "instructions/sra.typ"
#include "instructions/srar.typ"
#include "instructions/srl.typ"
#include "instructions/srlr.typ"
#include "instructions/store.typ"
#include "instructions/sub.typ"
#include "instructions/subi.typ"
#include "instructions/trap.typ"
#include "instructions/xor.typ"
#include "instructions/xori.typ"