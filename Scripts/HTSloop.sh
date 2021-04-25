#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00
#SBATCH -J HTSloop_test
#SBATCH -o HTSloop_ignore_test.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load htseq/0.12.4
module load python/3.7.2

indir=/proj/g2021012/nobackup/work/heidio
outdir=/domus/h1/heidio/GenomeAnalysis/03_Assembly/6_Transcriptomic/2_HTSeq

#Make folders
tmpdir=$SNIC_TMP/HTSeq
mkdir $tmpdir
mkdir $tmpdir/bam
cd $tmpdir


#copy files to temp
cp /domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/1_PROKKA/3_PB_illumina_NanoPore/PacBio_illumina_NanoPore.gff $tmpdir/
cp $indir/*name_sorted.bam $tmpdir/

ls -ahl $tmpdir

gff=$tmpdir/PacBio_illumina_NanoPore.gff

for v in $tmpdir/*
do
echo #Currently iterating: " $v
#python -m HTSeq.scripts.count -r name -f bam $v $gff > ${v}_HTS_python.txt
#htseq-count -r name -f bam $v $gff > ${v}_HTS_name.txt
#htseq-count -f bam $v $gff > ${v}_HTS.txt
#htseq-count -r name --secondary-alignments ignore --supplementary-alignments ignore -f bam $v $gff > ${v}_HTS_name_ignore.txt
htseq-count --secondary-alignments ignore --supplementary-alignments ignore -f bam $v $gff > ${v}_HTS_ignore.txt
done

cp -r *txt $outdir
