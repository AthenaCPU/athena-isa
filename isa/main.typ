#import "@preview/hydra:0.5.1": hydra

#set page(paper: "a5", margin: (y: 4em), numbering: "1", header: context {
  if calc.odd(here().page()) {
    align(right, emph(hydra(1)))
  } else {
    align(left, emph(hydra(2)))
  }
  line(length: 100%)
},)
#set document(
	title: "Athena Instruction Set",
	author: "d0p1",
	date: auto
)
#set heading(numbering: "1.1")
#show heading.where(level: 1): it => pagebreak(weak: true) + it
#set par(justify: true)

#include "frontpage.typ"

#outline()

#include "0-introduction.typ"

#include "1-basic-arch.typ"

#include "2-memory.typ"

#include "3-exceptions-and-int.typ"

#include "4-instructions-set.typ"

#include "5-examples.typ"

