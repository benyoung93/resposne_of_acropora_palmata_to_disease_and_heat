# Response of Acropora palmata to Different Disease Inoculations and Short Term Heat Stress  
All scripts and pipelines for bioinformatic analyses of 3 prime RNA-seq, 16S rRNA, and physiological data for the manuscript "Different disease inoculations cause common responses of the host immune system and prokaryotic component of the microbiome in _Acropora palmata_"  

## Physiological Analysis  
This includes the following  
- Temperature  
- IPAM  
- Buoyant Weight  
- Relative Risk  
  
  
## Transcriptomic Analysis  
This includes all pre processing and analysis in RStudio  
  
### Pre-processing  
- trimming and adapter removal ( _bbduk.sh_)  
- alignment and quant ( _salmon_)
  - alignment check and quant ( _STAR_ and _salmon_)  
  
### RStudio Analysis  
All programs used are in the RMarkdown in the transcriptomic directory.  
- _DHE_gene_expression.Rmd_ - all coral sample analysis  
- _DHE_T_pe_and_di_split_analyses.Rmd_ - pre-exposure and disease inoculated samples seperated
  
  
## 16S rRNA Analysis  
