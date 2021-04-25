#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 9:00:00
#SBATCH -J BAM_to_SAM_name_sort
#SBATCH -o BAM_to_SAM_name_sort.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load samtools/1.10

indir=/proj/g2021012/nobackup/work/heidio
outdir=/proj/g2021012/nobackup/work/heidio

#Make temp folders:
tmpdir=$SNIC_TMP/align
mkdir $tmpdir
cd $tmpdir

#copy files to temp folders
cp $indir/*.bam* $tmpdir/
#cp $indir/BWA_RNA_BHI_paired_ERR1797972_sorted.bam* $tmpdir/

ls -ahl
cd $tmpdir/

#run BWA
for v in $tmpdir/*.bam
do
echo "currently iterating: " $v
samtools view -h -o ${v}.sam $v
samtools sort -n -o ${v}_name_sorted.bam ${v}.sam
done

ls -ahl
cp *name_sorted.bam* *.sam $outdir/
