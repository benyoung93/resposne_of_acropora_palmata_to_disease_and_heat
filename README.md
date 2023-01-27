# Response of Acropora palmata to Different Disease Inoculations and Short Term Heat Stress  
All scripts and pipelines for bioinformatic analyses of 3 prime RNA-seq, 16S rRNA, and physiological data for the manuscript "Different disease inoculations cause common responses of the host immune system and prokaryotic component of the microbiome in *Acropora palmata*"  
  
All raw reads for omics analyses are available under NCBI project number **PRJNA895002** (N.B., waiting for successful publication before becoming available)  
  
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
  
I got lazy today I will finish this in a wee bit. 
