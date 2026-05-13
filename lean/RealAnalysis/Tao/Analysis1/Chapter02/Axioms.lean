import Mathlib.Tactic

/-!
### Chapter 2 — foundations (Tao *Analysis I*, 4th ed.)

**Dependency policy (this chapter):** only `Mathlib.Tactic` from Mathlib — no
`Mathlib.Data.*` lemmas. All facts are built from Lean’s inductive rules for
`TaoNat`, Tao’s recursive definition of addition, and theorems proved later in
`Lemmas.lean` / `Exercises.lean`.
-/

namespace RealAnalysis.Tao.Analysis1.Ch02

/-! ## The natural numbers (Peano-style, as in Tao) -/

inductive TaoNat : Type
  | zero : TaoNat
  | succ : TaoNat → TaoNat

deriving DecidableEq

namespace TaoNat

/-- Tao’s `+`: `0 + m = m`, `(n++) + m = (n + m)++` (recursion on the left summand). -/
def add : TaoNat → TaoNat → TaoNat
  | zero, m => m
  | succ n', m => succ (add n' m)

end TaoNat

open TaoNat (zero succ)

instance : OfNat TaoNat 0 where ofNat := zero

instance : Add TaoNat := ⟨TaoNat.add⟩

/-- Numeral `0` is the same as the `zero` constructor (for rewriting). -/
@[simp] theorem ofNat_zero : (0 : TaoNat) = zero :=
  rfl

/-- Tao: `0 + m = m` (left addition; use `zero` so `rw` matches `zero + …` goals). -/
@[simp] theorem zero_add (m : TaoNat) : zero + m = m := by
  show TaoNat.add zero m = m
  rfl

/-- Same fact with numeral `0` on the left (follows by `simp`). -/
theorem zero_add_ofNat (m : TaoNat) : (0 : TaoNat) + m = m := by
  simp

@[simp] theorem succ_add (n m : TaoNat) : succ n + m = succ (n + m) := by
  show TaoNat.add (succ n) m = succ (TaoNat.add n m)
  rfl

/-! ## Order and positivity (Tao 2.2.7, 2.2.11) -/

/-- `n ≥ m` in Tao’s sense: `n = m + a` for some `a`. -/
def TaoGe (n m : TaoNat) : Prop :=
  ∃ a : TaoNat, n = m + a

/-- Strict order: `n > m` means `n ≥ m` and `n ≠ m`. -/
def TaoGt (n m : TaoNat) : Prop :=
  TaoGe n m ∧ n ≠ m

/-- Strict `m' < m` (Tao): equivalently `m > m'`. -/
def TaoLt (m' m : TaoNat) : Prop :=
  TaoGt m m'

/-- Positive means `≠ 0` (Tao 2.2.7). -/
def TaoPositive (n : TaoNat) : Prop :=
  n ≠ 0

/-! ## Numerals (Tao 2.1.3) -/

abbrev tao_one : TaoNat :=
  succ 0

abbrev tao_two : TaoNat :=
  succ tao_one

abbrev tao_three : TaoNat :=
  succ tao_two

/-! ## Axioms 2.1–2.5 as theorems for `TaoNat` -/

/-- Tao 2.1: `0` is a natural number. -/
theorem axiom_2_1 : ∃ n : TaoNat, n = 0 :=
  ⟨0, rfl⟩

/-- Tao 2.2: successors are natural numbers. -/
theorem axiom_2_2 (n : TaoNat) : ∃ m : TaoNat, m = succ n :=
  ⟨succ n, rfl⟩

/-- Tao 2.3: `0` is not a successor. -/
theorem axiom_2_3 (n : TaoNat) : succ n ≠ 0 := by
  intro h
  cases h

/-- Tao 2.4: successor is injective. -/
theorem axiom_2_4 {n m : TaoNat} (h : succ n = succ m) : n = m := by
  cases h
  rfl

/-- Tao 2.5: induction on `TaoNat`. -/
theorem axiom_2_5 (P : TaoNat → Prop) (h0 : P 0) (hs : ∀ n, P n → P (succ n)) :
    ∀ n, P n := by
  intro n
  induction n with
  | zero => exact h0
  | succ n ih => exact hs n ih

end RealAnalysis.Tao.Analysis1.Ch02
