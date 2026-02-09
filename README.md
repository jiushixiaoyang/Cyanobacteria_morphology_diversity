# Cyanobacteria_morphology_diversity
Scripts and datasets for the analysis on genome evolution of Cyanobacteria morphological diversity

# Cyanobacterial phylogenomics

This repository provides scripts and metadata used in the phylogenomic,
molecular dating, and comparative genomic analyses described in:

The Genomic Origins of Cyanobacterial Morphological Diversity

## Data
Genome and protein sequences were downloaded from NCBI GenBank and RefSeq.
Accession numbers are listed in metadata/strain_list.tsv.

## Pipeline
Scripts in pipelines/ describe the main analytical steps:
1. Orthologue identification (CD-HIT, OrthoFinder, BUSCO)
2. rRNA prediction (RNAmmer)
3. Phylogenomic inference (MAFFT, trimAl, IQ-TREE)
4. Molecular dating (PhyloBayes)
5. Ancestral state reconstruction (sMap, Mesquite)
6. Comparative genomics (Count)

## Notes
Large intermediate files and genome sequences are not included due to size.
All parameters correspond exactly to those described in the Methods section.
