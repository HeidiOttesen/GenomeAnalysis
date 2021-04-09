#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J FastQC1_illumina_raw
#SBATCH -o FastQC1.log
#SBATCH -e FastQC1.err
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load FastQC/0.11.9 #latest version April 2021: 0.11.9 

output="/domus/h1/heidio/GenomeAnalysis/02_Preprocessing/1_FastQC/illumina/"

read1=$1
read2=$2

fastqc $read1 $read2 -o $output --threads 2

