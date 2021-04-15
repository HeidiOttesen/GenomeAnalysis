#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Quast_All
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load quast/4.5.4 #latest version April 2021: quast/5.0.2 - not working with sbatch. use 4.5.4 instead

out="/domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/2_Quast/2021.04.15_All"
mkdir $out
#input=$1
indir="/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links"

#quast.py -t 2 --scaffolds -o $out $input
quast.py -t 2 --scaffolds -o $out $indir/*.fasta
