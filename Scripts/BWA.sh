#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 7:15:00
#SBATCH -J BWA_illumina_on_PacBio
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load samtools/1.10
module load bwa/0.7.17

ref=$1 #eg pacbio contigs
read1=$2 #illumina read
read2=$3

bwa index $ref

bwa mem -M -t5
