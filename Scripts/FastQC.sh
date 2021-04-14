#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 15:00 --qos=short
#SBATCH -J FastQC_Nanopore_raw
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load FastQC/0.11.9 #latest version April 2021: 0.11.9 

#output="/domus/h1/heidio/GenomeAnalysis/02_Preprocessing/3_FastQC_Trimmed/illumina/"
output="/domus/h1/heidio/GenomeAnalysis/02_Preprocessing/1_FastQC_raw/Nanopore"


read1=$1
#read2=$2
#read3=$3
#read4=$4
#read5=$5
#read6=$6

fastqc $read1 -o $output --threads 1
#fastqc $read1 $read2 $read3 $read4 $read5 $read6 -o $output --threads 2

