#!/bin/bash
#BSUB -J DHE_h_quant
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/DHE_h_quant.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/DHE_h_quant.o%J


# making a list of sample names WITHOUT TRIMMED IN THEM (i.e. it saves numbers 1-69, not 1_trimmed to 69_trimmed :) )
PALMATA=`ls /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/trimmed | sed 's/\(.*\)_tr.fastq/\1/g'`

# making the mran file from the genome and gtf3 file
# if you do not do this it will prompt an error to do it
/nethome/bdy8/programs/gffread-0.9.12/gffread \
-w /nethome/bdy8/apal_genome/version3.1/Apalm_gffread_for_salmon.fasta \
-g /nethome/bdy8/apal_genome/version3.1/Apalm_assembly_v3.1_200911.masked.fasta \
/nethome/bdy8/apal_genome/version3.1/Apalm_assembly_v3.1_notrna_200911.gff3

for PALPAL in $PALMATA
do
echo "$PALPAL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -J '"${PALPAL}"'_h_quant' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -q bigmem' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -n 8' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -R "rusage[mem=5000]"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -P transcriptomics' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon/'"$PALPAL"'_he_quant.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon/'"$PALPAL"'_ho_quant.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job

echo 'echo "This is the sample being quantified -'"${PALPAL}"'"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
echo '/nethome/bdy8/programs/salmon-0.10.0_linux_x86_64/bin/salmon \
quant \
-t /nethome/bdy8/apal_genome/version3.0/Apalm_gffread_for_salmon.fasta \
-l SR \
-a /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/aligned/'"$PALPAL"'/'"$PALPAL"'_Aligned.toTranscriptome.out.bam \
-o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/salmon/'"${PALPAL}"'_salmon' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job

echo 'echo "Sample '"${PALPAL}"' has been quantified and saved"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job

bsub < /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/quant/"$PALPAL"_salmon_quant.job
done
