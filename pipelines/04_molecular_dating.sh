#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Molecular dating using Bayesian MCMC
#
# This script documents the analysis of 16S/23S rRNA sequences
# to estimate divergence times under fossil and geological calibrations.
###############################################################################

# software version used:
# PhyloBayes v4.1

# Input:
# - Multiple sequence alignment of 16S and 23S rRNA genes
# - Fixed species tree topology
# - Calibration file with fossil and geological constraints

# Run molecular dating using the CAT+GTR+Gamma model
pb -d 16s_23s.phy \
   -T species_tree.tre \
   -cal calibration.txt \
   -r outgroup \
   -bd -sb -ugam -gtr -cat \
   -f chain1

# To test the prior (calibration only), run without sequences:
pb -d 16s_23s.phy \
   -T species_tree.tre \
   -cal calibration.txt \
   -r outgroup \
   -bd -sb -ugam -gtr -cat \
   -prior \
   -f prior_chain1

# Output:
# - Posterior samples of node ages
# - Log files for MCMC convergence
# - Summary of divergence times

