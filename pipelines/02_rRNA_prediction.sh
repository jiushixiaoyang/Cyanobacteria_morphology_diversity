#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# Ribosomal RNA gene prediction
#
# This script documents the software and parameters used to predict
# highly conserved ribosomal RNA genes for phylogenomic analyses.
###############################################################################

# software version used:
# RNAmmer v1.2

# target genes:
# - 16S rRNA (SSU)
# - 23S rRNA (LSU)

# predict 16S rRNA
rnammer \
  -S bac \
  -m ssu \
  -f genome_16S.fasta \
  genome.fna

# predict 23S rRNA
rnammer \
  -S bac \
  -m lsu \
  -f genome_23S.fasta \
  genome.fna

# Output:
# - Predicted 16S and 23S rRNA sequences used in phylogenomic reconstruction

