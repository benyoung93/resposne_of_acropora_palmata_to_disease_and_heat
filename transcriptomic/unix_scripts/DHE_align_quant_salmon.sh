#!/bin/bash
#BSUB -J DHE_h_salmon
#BSUB -q debug
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon_a_q.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon_a_q.o%J

# making a list of sample names
PALMATA=`ls /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/trimmed | sed 's/\(.*\)_tr.fastq/\1/g'`

echo "samples being aligned"
echo $PALMATA

## salmon index info
#/nethome/bdy8/programs/salmon-latest_linux_x86_64/bin/salmon \
#index \
#-t /nethome/bdy8/apal_genome/version3.1/Apalm_assembly_v3.1_200911.mrna.fasta \
#-i /nethome/bdy8/apal_genome/Apalm_index \
#-k 19

for PALPAL in $PALMATA
do
echo "$PALPAL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
echo '#BSUB -J '"$PALPAL"'_h_align' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon/'"$PALPAL"'_he_salmon.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/salmon/'"$PALPAL"'_ho_salmon.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
echo '#BSUB -q bigmem'  >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
echo '#BSUB -n 2' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh

echo '/nethome/bdy8/programs/salmon-latest_linux_x86_64/bin/salmon quant \
-i /nethome/bdy8/apal_genome/Apalm_index \
-l SF \
-r /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/trimmed/'"${PALPAL}"'_tr.fastq \
--validateMappings \
--noLengthCorrection \
--softclip \
--minScoreFraction 0.0 \
--writeUnmappedNames u \
-o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/salmon/'"${PALPAL}"'_salmon' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
bsub < /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/salmon/"$PALPAL"_h_salmon.sh
done
