# Pipelines

This folder contains minimal, documentation-style scripts corresponding
to the analytical steps described in the Methods section.

The scripts record the software versions and key parameters used in the study,
but omit file paths, cluster submission details, and looping logic.

## Pipelines overview

- `01_orthology.sh`  
  Identification of single-copy orthologs (BUSCO) and homologous groups
  (OrthoFinder).

- `02_rRNA_prediction.sh`  
  Highly conserved 16S (SSU) and 23S (LSU) rRNA genes were predicted
  from genome assemblies using RNAmmer.

- `03_phylogenomics.sh`  
  Single-copy orthologs identified by BUSCO were aligned using MAFFT and trimmed
  with trimAl. Gene-wise model testing and maximum-likelihood gene tree inference
  were conducted using IQ-TREE (ModelFinder).

  Genes showing strong topological anomalies (e.g. extreme long-branch attraction)
  were excluded based on manual inspection of gene trees. The curated ortholog set
  was then concatenated using FASconCAT-G, and a partitioned phylogenomic tree was
  inferred using IQ-TREE with 1,000 ultrafast bootstrap replicates.

- `04_molecular_dating.sh`  
  Bayesian molecular dating using PhyloBayes.

- `05_ancestral_state.sh`  
  Ancestral state reconstruction using stochastic mapping analysis (sMap) and parsimony analyses (Mesquite).

- `06_comparative_genomics.sh`  
  Inference of gene family nonel&lost (phylogenetically-aware parsing script) and expaned&contracted (Count) across the phylogeny.

## Important note
These scripts are not intended to be run as-is.
They serve as transparent documentation of analytical choices.

