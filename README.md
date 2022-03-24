# Workflow for "Demographic reconstruction of Antarctic fur seals supports the krill surplus hypothesis", Hoffman et al (in prep)

This repository includes the full workflow used for Hoffman et al. (2022) "Demographic reconstruction of Antarctic fur seals supports the krill surplus hypothesis". Genes Special Issue “Polar Genomics”, 13: 541 https://www.mdpi.com/2073-4425/13/3/541

The raw RAD-seq reads are available at https://trace.ncbi.nlm.nih.gov/Traces/sra/?study=SRP148937

Within this workflow, you will find:

A) bash scripts used for alignment, SNP calling, SNP filtering (not used in manuscript as we are working with genotype likelihoods)

B) bash scripts and files used to run fastsimcoal for demographic modelling and non-parametric bootstrapping

C) R-scripts used for plotting figures

Please ensure that your server has sufficient computing power and memory for ANGSD and fastsimcoal2 to run.
