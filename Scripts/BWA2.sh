#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:15:00
#SBATCH -J BWA_RNA_BHI_paired2
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load samtools/1.10
module load bwa/0.7.17


refdir="/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links/"
indir=/domus/h1/heidio/GenomeAnalysis/01_RawData/TranscriptomicsData/RNA-Seq_BH
outdir=/domus/h1/heidio/GenomeAnalysis/03_Assembly/6_Transcriptomic/1_BWA/RNA-Seq_BH

#Make temp folders:
tmpdir=$SNIC_TMP/align
mkdir $tmpdir
mkdir $tmpdir/fq
cd $tmpdir

#copy files to temp folders
#cp $indir/*.fastq.gz $tmpdir/fq/
cp $indir/trim_paired_ERR1797972_pass_1.fastq.gz $tmpdir/fq/
cp $indir/trim_paired_ERR1797972_pass_2.fastq.gz $tmpdir/fq/
cp $refdir/Pilon_illumina_Nanopore_PacBio.fasta $tmpdir/
cd $tmpdir

#unzip fasta files:
for v in fq/*
do
echo "Unzipping file: " $v
gunzip $v
done

ls -ahl
cd $tmpdir/fq/
ls -ahl

id="BWA_RNA_BHI_paired_ERR1797972"
ref=$tmpdir/Pilon_illumina_Nanopore_PacBio.fasta

read1=trim_paired_ERR1797972_pass_1.fastq
read2=trim_paired_ERR1797972_pass_2.fastq
#read1=trim_paired_ERR1797972_pass_1.fastq.gz read2=trim_paired_ERR1797972_pass_2.fastq.gz read3=trim_paired_ERR1797973_pass_1.fastq.gz read4=trim_paired_ERR1797973_pass_2.fastq.gz read5=trim_paired_ERR1797974_pass_1.fastq.gz read6=trim_paired_ERR1797974_pass_2.fastq.gz

#run BWA
bwa index $ref
#bwa mem -t 2 $ref $read1,$read2,$read3,$read4,$read5,$read6 > ${id}.sam
bwa mem -t 2 $ref $read1 $read2 > ${id}.sam
#bwa mem -t 2 $ref $read1 $read2 $read3 $read4 $read5 $read6 $read7,$read8,$read9,$read10,$read11,$read12,$read13 > ${id}.sam
samtools sort -o ${id}_sorted.bam ${id}.sam
samtools index ${id}_sorted.bam

ls -ahl
cp *.bam *.bai $out_path/
