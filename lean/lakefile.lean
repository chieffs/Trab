import Lake
open Lake DSL

package «RealAnalysis» where
  leanOptions := #[⟨`relaxedAutoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «RealAnalysis» where
  roots := #[`RealAnalysis]
