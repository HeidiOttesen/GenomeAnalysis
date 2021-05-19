#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 20:00:00
#SBATCH -J HTSloop
#SBATCH -o HTSloop_all.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load htseq/0.12.4
module load python/3.7.2

#indir=/proj/g2021012/nobackup/work/heidio/extra_sam_bam
indir=/proj/g2021012/nobackup/work/heidio
outdir=/domus/h1/heidio/GenomeAnalysis/03_Assembly/6_Transcriptomic/2_HTSeq

#Make folders
tmpdir=$SNIC_TMP/HTSeq
mkdir $tmpdir
mkdir $tmpdir/bam
cd $tmpdir


#copy files to temp
cp /domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/1_PROKKA/3_PB_illumina_NanoPore/PacBio_illumina_NanoPore.gff $tmpdir/
cp $indir/*.bam* $tmpdir/bam/
#cp $indir/BWA_RNA_BHI_paired_ERR1797972_sorted.bam_name_sorted.bam $tmpdir/bam/
#cp $indir/BWA_RNA_BHI_paired_ERR1797972_sorted.bam* $tmpdir/bam/

ls -ahl $tmpdir

gff=$tmpdir/PacBio_illumina_NanoPore.gff

for v in $tmpdir/bam/*.bam
do
echo #Currently iterating: " $v
#python -m HTSeq.scripts.count -r name -f bam $v $gff > ${v}_HTS_python.txt
htseq-count -t CDS -i locus_tag -f bam $v $gff > ${v}_HTS.txt
#htseq-count -f bam $v $gff > ${v}_HTS.txt
#htseq-count -r name --secondary-alignments ignore --supplementary-alignments ignore -f bam $v $gff > ${v}_HTS_name_ignore.txt
#htseq-count --secondary-alignments ignore --supplementary-alignments ignore -f bam $v $gff > ${v}_HTS_ignore.txt
done

ls -ahl $tmpdir/
ls -ahl $tmpdir/bam/

cp -r $tmpdir/bam/*txt $outdir
