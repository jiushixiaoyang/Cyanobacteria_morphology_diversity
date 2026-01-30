#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Orthology inference
#
# This script documents the software and commands used for:
# 1) Identifying single-copy orthologs for phylogenomics (BUSCO)
# 2) Inferring homologous groups for comparative genomics (OrthoFinder)
#
# This is a minimal, documentation-style script for reproducibility.
###############################################################################

#######################################
# 1. BUSCO: single-copy orthologs
#######################################

# software version:
# BUSCO v5.4.4
# lineage dataset: cyanobacteria_odb10

busco \
  -i genome.fna \
  -l cyanobacteria_odb10 \
  -m geno

# Output:
# - Single-copy orthologs used for phylogenomic tree reconstruction


#######################################
# 2. CD-HIT: proteome dereplication
#######################################

# software version:
# CD-HIT v4.8.1

cd-hit \
  -i proteome.faa \
  -o proteome_nr.faa \
  -c 1.00 \
  -n 5 \
  -M 16000 \
  -d 0

# Output:
# - Non-redundant proteomes for homology inference


#######################################
# 3. OrthoFinder: homologous groups
#######################################

# software version:
# OrthoFinder v2.5.5
# DIAMOND, MAFFT, FastTree used internally

orthofinder \
  -f proteome_nr/ \
  -M msa \
  -S diamond \
  -A mafft \
  -T fasttree

# Output:
# - Homologous groups (HGs) used for comparative genomics

