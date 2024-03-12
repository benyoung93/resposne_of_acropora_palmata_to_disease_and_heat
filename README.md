# Response of Acropora palmata to Different Disease Inoculations and Short Term Heat Stress  
All scripts and pipelines for bioinformatic analyses of 3 prime RNA-seq, 16S rRNA, and physiological data for the manuscript "Different disease inoculations cause common responses of the host immune system and prokaryotic component of the microbiome in *Acropora palmata*"  
  
Publication Link - https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0286293  
  
All raw reads for omics analyses are available under NCBI project number **PRJNA895002** (https://www.ncbi.nlm.nih.gov/bioproject/PRJNA895002). 
For each rmarkdown, RData files are provided if people want to use them.  
  
## Physiological Analysis  
This includes the following  
- Temperature (*temp_bw_ipam_analyses.Rmd*)
- IPAM (*temp_bw_ipam_analyses.Rmd*)
- Buoyant Weight (*temp_bw_ipam_analyses.Rmd*)
- Relative Risk (*DHE_Relativerisk.Rmd*)  
  
  
## Transcriptomic Analysis  
This includes all pre processing and analysis in RStudio  
  
### Pre-processing  
- trimming and adapter removal (*bbduk.sh*)  
- alignment and quant (*salmon*)
  - alignment check and quant (*STAR* and *salmon*)  
  
### RStudio Analysis  
All programs used are in the RMarkdown in the transcriptomic directory.  
- **DHE_gene_expression.Rmd** - all coral sample analysis  
- **DHE_T_pe_and_di_split_analyses.Rmd** - pre-exposure and disease inoculated samples seperated
  
  
## 16S rRNA Analysis  
  
All programs used are in the prokaryotic directory.  
- **dada2_prep_sep_emodels_DHE.Rmd** - generation of counts, taxonomy, and fasta file for analyses
- **DHE_16s.Rmd** - analysis of all samples
- **DHE_16s_split_preexposure_and_diseaseinoculated.Rmd** - analysis pre exposure and exposed seperately. 
