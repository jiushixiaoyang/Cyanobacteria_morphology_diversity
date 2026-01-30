#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Phylogenomic inference using BUSCO single-copy orthologs
#
# This script documents the main analytical steps used to infer
# phylogenomic relationships prior to molecular dating.
###############################################################################

# software versions used:
# MAFFT v7.429
# trimAl v1.2
# IQ-TREE v2.2.2.7
# FASconCAT-G v1.05.1

###############################################################################
# Step 1: Alignment and trimming of single-copy orthologs
###############################################################################

# Multiple sequence alignment
mafft --auto input_gene.faa > input_gene.aln.faa

# Automated alignment trimming
trimal -automated1 \
       -in input_gene.aln.faa \
       -out input_gene.trimmed.faa


###############################################################################
# Step 2: Gene-wise model testing and gene tree inference
###############################################################################

# Model selection and maximum-likelihood gene tree inference
iqtree2 \
  -s input_gene.trimmed.faa \
  -m MF+MERGE


###############################################################################
# Step 3: Concatenation of curated orthologs
###############################################################################

# Concatenate alignments and generate partition information
perl FASconCAT-G_v1.05.1.pl -s -p -l


###############################################################################
# Step 4: Partitioned phylogenomic inference
###############################################################################

# Species tree inference using concatenated supermatrix
iqtree2 \
  -s prot_supermatrix.phy \
  -p partitions.nex \
  -B 1000 \
  --symtest-remove-bad

# Output:
# - Concatenated supermatrix
# - Partitioned maximum-likelihood phylogeny

