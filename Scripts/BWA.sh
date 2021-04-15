#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 2:15:00
#SBATCH -J BWA_illumina_on_PacBio
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load samtools/1.10
module load bwa/0.7.17

ref="/domus/h1/heidio/GenomeAnalysis/03_Assembly/1_PacBio/E745.contigs.fasta" #eg pacbio contigs
read1="/domus/h1/heidio/GenomeAnalysis/03_Assembly/3_illumina_Nanopore/contigs.fasta"
#read1="/proj/g2021012/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
#read2="/proj/g2021012/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"

id="BWA_illumina+Nanopore_contigs_on_PacBio"

bwa index $ref

bwa mem -t 5 $ref $read1 > ${id}.sam

samtools view -b ${id}.sam > ${id}.bam
samtools sort -o ${id}_sorted.bam ${id}.bam
samtools index ${id}_sorted.bam
