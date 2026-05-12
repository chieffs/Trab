---
book: Tao — Analysis I
edition: 4th
chapter: "2"
chapter_slug: Real Numbers
tags:
  - tao
  - analysis-2
lean_file: Chapter02_NaturalNumbers.lean
date: 12/05/2026
---

# Ch.2 — title

## Summary (own words)
Definition of the real numbers base on Peano Axioms and the properties emerging from them
## Axioms
### 2.1
0 is a natural number

### 2.2
if n is a natural number, then n++ is also a natural number

### 2.3
0 is note the successor of any natural number; *i.e*, 
$$
\forall n \in \mathbb{N},\, n++ \neq 0
$$
### 2.4

## Key definitions
### Increment operator (++)
We define the increment operator ++ as such, assuming that 0 exists, as in axiom [[#2.1]]
$0++$ is the successor of 0 and $(0++)++$ is the successor of $0++$, so on and so forth, for every natural $n, \, n++$ is the successor of $n$

### Natural numbers
The natural numbers are defined as the set
$$
\mathbb{N} \coloneqq \{ 0,0++,(0++)++,\dots \}   
$$

## Key lemmas / theorems

## Proof ideas (informal)

## Exercises checklist

| # | statement (short) | Lean status |
|---|-------------------|-------------|
| | | todo / sorry / done |

## Lean log

- Module: `lean/...`
- Mathlib highlights:

## Questions / follow-ups
