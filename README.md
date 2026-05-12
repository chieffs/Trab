# Trab

Short for **T**ao **R**eal **A**nalysis **B**ook (in **Lean**): a study workspace for Terence Tao’s *Analysis I* (and later *Analysis II*). Use **Obsidian** for chapter notes and intuition, and **Lean 4** with **Mathlib** to formalize definitions, proofs, and exercises.

**Remote:** [github.com/chieffs/Trab](https://github.com/chieffs/Trab)

Clone:

```bash
git clone https://github.com/chieffs/Trab.git
cd Trab
```

## Prerequisites

- [Elan](https://github.com/leanprover/elan) (Lean toolchain manager) and a working `lake` command.
- [Obsidian](https://obsidian.md/) (optional but recommended for notes).
- A local clone of this repository.

## Repository layout

```text
.
├── README.md                 # This file
├── lean/                     # Lean 4 Lake project (Mathlib)
│   ├── lakefile.lean
│   ├── lean-toolchain        # Pin aligned with Mathlib
│   ├── RealAnalysis.lean     # Library root: import new modules here
│   └── RealAnalysis/
│       └── Tao/
│           └── Analysis1/  # One Lean file per chapter (or logical block)
└── vault/                    # Obsidian vault root
    ├── Study-Hub.md          # Entry point and quick workflow
    ├── templates/
    │   └── Tao-Chapter-Note.md
    └── book/
        └── tao-analysis-1/   # Chapter notes live here
```

If you add *Analysis II*, mirror the pattern: `lean/RealAnalysis/Tao/Analysis2/` and `vault/book/tao-analysis-2/`.

## How to study from this project

Use a fixed loop so notes and formal code stay aligned.

1. **Read** the assigned section in Tao’s book.
2. **Note** — In Obsidian, open `vault` as your vault. Copy `vault/templates/Tao-Chapter-Note.md` into `vault/book/tao-analysis-1/` with a clear name (for example `ch03-natural-numbers.md`). Fill summary, definitions, informal proof ideas, and the exercise checklist table.
3. **Formalize** — In `lean/RealAnalysis/Tao/Analysis1/`, edit the chapter file (or create a new one). State theorems for each exercise; use `sorry` as a scaffold until the proof is complete.
4. **Check** — From `lean/`, run `lake build`. Fix errors until the project builds.
5. **Reflect** — Update the chapter note: exercise statuses, Mathlib lemmas you used, and questions for later.

Optional: use tags such as `#tao`, `#analysis-1`, `#ch03`, `#exercise` in front matter or inline for easier search.

## How to add to the project

### New chapter (Lean)

1. Add a file under `lean/RealAnalysis/Tao/Analysis1/`, for example `Chapter04_IntegersRationals.lean`.
2. Use a chapter-scoped namespace (for example `namespace RealAnalysis.Tao.Analysis1.Ch04`) and `import` only the Mathlib modules you need (prefer narrow imports over blanket `import Mathlib` when possible).
3. Open `lean/RealAnalysis.lean` and add a line:  
   `import RealAnalysis.Tao.Analysis1.Chapter04_IntegersRationals`  
   so Lake builds the new module.

### New chapter (Obsidian)

1. Duplicate `vault/templates/Tao-Chapter-Note.md` into `vault/book/tao-analysis-1/`.
2. Set front matter (`chapter`, `chapter_slug`, `lean_file`, `date`) and link to the corresponding path under `lean/RealAnalysis/...`.

### New exercise or lemma

1. In the chapter’s `.lean` file, add a `theorem` or `lemma` with a stable name (for example `ex_4_3_7` for Exercise 4.3.7).
2. Mark unfinished work with `sorry` (Lean will accept it until you replace it with a real proof).
3. Track status in the chapter note’s exercise table.

### Toolchain and Mathlib

If `lake build` fails because of a Lean or Mathlib version mismatch, align `lean/lean-toolchain` with the version declared in [mathlib4’s `lean-toolchain`](https://github.com/leanprover-community/mathlib4/blob/master/lean-toolchain), then run:

```bash
cd lean
lake update
lake exe cache get   # optional; speeds up Mathlib fetch/build
lake build
```

### Git and GitHub

Commit notes and Lean together so each commit tells a coherent story (for example “Chapter 3: exercises 3.5.1–3.5.3”).

## License

No book text from Tao is included in this repository; only your notes and Lean sources. Choose a license for your own code and notes (for example MIT for Lean files) if you publish the repo publicly.
