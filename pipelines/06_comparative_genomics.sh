#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Comparative genomics: gains/losses and gene family size evolution
#
# This script documents the approaches used to infer:
# 1) Novel and lost homologous groups (HGs) using phylogenetically-aware parsing script
#    (Paps & Holland, 2018)
# 2) Expanded and contracted HGs using Count (GUI) under Wagner parsimony
###############################################################################

# software / methods used:
# - Phylogenetically-aware parsing script (Paps & Holland, 2018)
# - Count v9.1106 RC1 (GUI), Wagner parsimony model

###############################################################################
# Input data
###############################################################################

# - Species phylogeny (Newick), matching the strain set used in downstream analyses
# - HG presence/absence (or gene family size) matrix derived from homology inference
#   (e.g., OrthoFinder homologous groups)
# - Outgroup definition (to distinguish clade-specific vs ancestral HGs)

###############################################################################
# 1) Novel and lost HGs (phylogenetically-aware parsing script)
###############################################################################

# Definitions used:
# - Novel HGs:
#   HGs inferred to be present in the LCA of a focal clade but absent from outgroups.
#
# - Lost HGs:
#   HGs inferred to be present in the LCA of a focal clade but missing from the clade
#   (i.e., inferred losses along the focal lineage).

# Method:
# - Apply phylogenetically-aware parsing on the HG matrix along the species tree
#   to infer gains and losses while accounting for phylogenetic structure.

# Output:
# - Lists of novel HGs per selected evolutionary node/clade
# - Lists of lost HGs per selected evolutionary node/clade

###############################################################################
# 2) Expanded and contracted HGs (Count; GUI-based)
###############################################################################

# Method:
# - Use Count to reconstruct ancestral gene family sizes and infer lineage-specific
#   expansions and contractions by minimizing gain/loss events (Wagner parsimony).
#
# Analysis (performed via GUI):
# - Load the species tree and HG family-size matrix into Count
# - Select Wagner parsimony model
# - Reconstruct ancestral family sizes and summarize branch-specific changes

# Output:
# - HGs expanded on specified branches (increased copy number)
# - HGs contracted on specified branches (decreased copy number)
# - Ancestral family-size reconstructions across the phylogeny

###############################################################################
# Notes
###############################################################################

# This repository provides documentation-style scripts for transparency.
# Large intermediate files (full HG matrices, Count project files, etc.) are not included.

