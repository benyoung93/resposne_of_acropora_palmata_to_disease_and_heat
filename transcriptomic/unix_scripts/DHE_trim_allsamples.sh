#!/bin/bash
#BSUB -J Trimming
#BSUB -q bigmem
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/trimming.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/trimming.o%J

## Original Samples
# creating variables and what not
deproj='/scratch/projects/transcriptomics/ben_young/DHE/tagseq'

# making a list of sample names
PALMATA=`ls /scratch/projects/transcriptomics/ben_young/DHE/tagseq/raw_reads/ln3 | cut -f 1 -d '.'`

# the files being processed
echo "samples being trimmed"
echo $PALMATA

# trimming the files
for PALPAL in $PALMATA
do
echo "$PALPAL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -q bigmem' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -J '"$PALPAL"'_trim' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/error_outputs/trimming/'"$PALPAL"'_o_trim.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/error_outputs/trimming/'"$PALPAL"'_e_trim.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -n 5' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -R "rusage[mem=4000]"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh

echo 'module load java/1.8.0_60' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo 'echo "This is the palmata sample being trimmed - '"${PALMATA}"'"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo 'bbduk.sh \
-Xmx512m \
in=/scratch/projects/transcriptomics/ben_young/DHE/tagseq/raw_reads/ln3/'"${PALPAL}"'.fastq \
out=/scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/trimmed/'"${PALPAL}"'_tr.fastq \
ref=/nethome/bdy8/programs/bbmap/resources/polyA.fa.gz,/nethome/bdy8/programs/bbmap/resources/truseq_rna.fa.gz \
k=13 \
ktrim=r \
useshortkmers=T \
mink=5 \
qtrim=10 \
minlength=20' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh

bsub < /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
done

## Redo samples
# creating variables and what not
deproj='/scratch/projects/transcriptomics/ben_young/DHE/tagseq'

# making a list of sample names
PALMATA=`ls /scratch/projects/transcriptomics/ben_young/DHE/tagseq/raw_reads/ln3 | cut -f 1 -d '.'`

# the files being processed
echo "samples being trimmed"
echo $PALMATA

# trimming the files
for PALPAL in $PALMATA
do
echo "$PALPAL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -q bigmem' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -J '"$PALPAL"'_trim' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/error_outputs/trimming/'"$PALPAL"'_o_trim.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/error_outputs/trimming/'"$PALPAL"'_e_trim.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -n 5' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo '#BSUB -R "rusage[mem=4000]"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh

echo 'module load java/1.8.0_60' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo 'echo "This is the palmata sample being trimmed - '"${PALMATA}"'"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
echo 'bbduk.sh \
-Xmx512m \
in=/scratch/projects/transcriptomics/ben_young/DHE/tagseq/raw_reads/ln3/'"${PALPAL}"'.fastq \
out=/scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/trimmed/'"${PALPAL}"'_tr.fastq \
ref=/nethome/bdy8/programs/bbmap/resources/polyA.fa.gz,/nethome/bdy8/programs/bbmap/resources/truseq_rna.fa.gz \
k=13 \
ktrim=r \
useshortkmers=T \
mink=5 \
qtrim=10 \
minlength=20' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh

bsub < /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/ln911/loop_scripts/trimmed/"$PALPAL"_trimming.sh
done
