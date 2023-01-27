#!/bin/bash
#BSUB -J DHE_h_align
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/STAR_h_align.e%J
#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/STAR_h_align.o%J

# making a list of sample names
PALMATA=`ls /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/trimmed | sed 's/\(.*\)_tr.fastq/\1/g'`

# the files being processed
echo "samples being aligned"
echo $PALMATA

for PALPAL in $PALMATA
do
mkdir /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/aligned/${PALPAL}
echo "$PALPAL"
echo '#!/bin/bash' > /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -J '"$PALPAL"'_h_align' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -e /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/align/'"$PALPAL"'_he_align.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -o /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/error_outputs/align/'"$PALPAL"'_ho_align.txt' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -q bigmem'  >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -n 8' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
echo '#BSUB -R "rusage[mem=6000]"' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh

echo '/nethome/bdy8/programs/STAR \
--runThreadN 8 \
--genomeDir /nethome/bdy8/apal_genome/v3.1_star_index \
--readFilesIn /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/trimmed/'"${PALPAL}"'_tr.fastq \
--outFilterType BySJout \
--outFilterMultimapNmax 20 \
--outFilterMismatchNoverLmax 0.1 \
--alignIntronMin 20 \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--outSAMtype BAM SortedByCoordinate \
--quantMode TranscriptomeSAM GeneCounts \
--outSAMstrandField intronMotif \
--twopassMode Basic \
--outFilterScoreMinOverLread 0.2 \
--outFilterMatchNminOverLread 0.2 \
--twopass1readsN -1 \
--outReadsUnmapped Fastx \
--outFileNamePrefix /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/aligned/'"$PALPAL"'/'"$PALPAL"'_' >> /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
bsub < /scratch/projects/transcriptomics/ben_young/DHE/tagseq/host/loop_scripts/align/"$PALPAL"_h_align.sh
done

#--outFilterScoreMinOverLread 0.5 \
#--outFilterMatchNminOverLread 0.5 \
