#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Ancestral state reconstruction (GUI-based analyses)
#
# Discrete morphological states were reconstructed using:
# 1) Maximum-likelihood (ML) inference in sMap
# 2) Bayesian inference in sMap, with stepping-stone sampling for model support
# 3) Parsimony reconstruction in Mesquite (model-independent comparison)
###############################################################################

# software used (GUI):
# - sMap v1.0.7
# - Mesquite v4.01

###############################################################################
# Input data
###############################################################################

# sMap input:
# - Discrete character matrix (morphological states)
# - 9,960 time-calibrated phylogenetic trees (posterior samples)
# - Time-calibrated summarized/consensus tree (for visualization)

# Mesquite input:
# - Time-calibrated summarized/consensus tree
# - Discrete character matrix

###############################################################################
# sMap: transition-rate models
###############################################################################

# The same transition-rate model families were used in both ML and Bayesian
# analyses within sMap.

# For two-state characters:
# - ARD (all-rates-different): forward and reverse rates estimated independently
# - ER (equal-rates): forward and reverse rates constrained to be equal

# For five-state characters:
# - ARD (all-rates-different)
# - ER (equal-rates)
# - SYM (symmetric): reciprocal rates constrained to be equal (e.g. U→B = B→U)

# For five-state analyses, transitions were additionally constrained such that
# only biologically plausible transitions were allowed:
#   U ↔ B
#   U ↔ F
#   B ↔ F
#   F ↔ H
#   H ↔ R
# All other transitions were fixed to zero.

###############################################################################
# sMap: ML and Bayesian analyses
###############################################################################

# ML analyses:
# - Likelihood-based ancestral state reconstruction under the models above.

# Bayesian analyses:
# - Stepping-stone sampling was used to estimate model marginal likelihoods
#   and quantify relative support among ARD/ER (two-state) or ARD/ER/SYM (five-state).
# - Final reconstructions were obtained by model averaging across supported models.

# Output (sMap):
# - Ancestral state probabilities at internal nodes
# - Model marginal likelihoods and model weights (from stepping-stone sampling)
# - Model-posterior probability blended ancestral state reconstructions

###############################################################################
# Mesquite: parsimony reconstruction
###############################################################################

# Parsimony ancestral state reconstruction was performed in Mesquite using
# the same character matrix and the summarized/consensus tree.
# This provides a model-independent comparison to sMap results.

