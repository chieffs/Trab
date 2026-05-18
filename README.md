# TRAB

Short for **T**ao **R**eal **A**nalysis **B**ook (in **Lean**): a study workspace for Terence Tao’s *Analysis I* (and later *Analysis II*). Use **Obsidian** for chapter notes and intuition, and **Lean 4** with **Mathlib** to formalize definitions, proofs, and exercises.

**Edition note:** folder names such as `Chapter02` follow **Tao *Analysis I*, 4th edition** chapter numbering (for example **natural numbers = Chapter 2**). If you use another edition, renumber Lean paths and notes to match your book.

**Remote:** [github.com/chieffs/TRAB](https://github.com/chieffs/TRAB)

**Who am I and goals for this project:**

I have a degree in applied maths and am currently conducting research in epidemiology and causal inference. This project is my way of learning Lean 4 and Real Analysis concurrently. 
All the Obsidian notes are my notes and paraphrasing from the book *Analysis* by Terence Tao.
I use Cursor AI to help maintain the repository and—**only for lemmas and corollaries that the book proves in full (not as exercises)**—sometimes to write the **Lean** formalization. 

**I write all Lean for exercises myself.** **All** lemma text in my notes (including in Obsidian) and **all LaTeX** are mine; Cursor may assist **only** with that book-proved, non-exercise Lean.
Also every error in this project is solely my own fault and not the fault of Cursor or Tao's work.

I hope you have a nice time or learn something from this repository, as I certainly had both a great time and a great deal of learning from this.


Clone:

```bash
git clone https://github.com/chieffs/TRAB.git
cd TRAB
```

## Prerequisites

- [Elan](https://github.com/leanprover/elan) (Lean toolchain manager) and a working `lake` command.
- [Obsidian](https://obsidian.md/) (optional but recommended for notes).
- A local clone of this repository.

## Repository layout

```text
.
├── LICENSE                   # MIT
├── README.md                 # This file
├── lean/                     # Lean 4 Lake project (Mathlib)
│   ├── lakefile.lean
│   ├── lean-toolchain        # Pin aligned with Mathlib
│   ├── RealAnalysis.lean     # Library root: import chapter *Basic* modules here
│   └── RealAnalysis/
│       └── Tao/
│           └── Analysis1/
│               └── Chapter02/   # 4th ed.: natural numbers (see Layered chapters)
│                   ├── Axioms.lean
│                   ├── Lemmas.lean
│                   ├── Exercises.lean
│                   └── Basic.lean    # re-exports stack for downstream imports
└── vault/                    # Obsidian vault root
    ├── Study-Hub.md          # Entry point and quick workflow
    ├── templates/
    │   └── Tao-Chapter-Note.md
    └── book/
        └── tao-analysis-1/   # Chapter notes live here
```

### Toolchain and Mathlib

If `lake build` fails because of a Lean or Mathlib version mismatch, align `lean/lean-toolchain` with the version declared in [mathlib4’s `lean-toolchain`](https://github.com/leanprover-community/mathlib4/blob/master/lean-toolchain), then run:

```bash
cd lean
lake update
lake exe cache get   # optional; speeds up Mathlib fetch/build
lake build
```


## License

This repository is licensed under the [MIT License](LICENSE).

Terence Tao’s *Analysis I/II* is not included here (only your notes and Lean sources). Mathlib is a separate dependency under its own license; see [mathlib4](https://github.com/leanprover-community/mathlib4).
