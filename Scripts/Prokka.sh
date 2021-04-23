#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J PROKKA
#SBATCH -o PROKKA_PB_ill_NP
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load prokka/1.45-5b58020

ref="/domus/h1/heidio/GenomeAnalysis/03_Assembly/0_ReferenceGenome/Efaecium_ref.fna"
read1=/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links/Pilon_illumina_Nanopore_PacBio.fasta
id="PacBio_illumina_NanoPore"
outdir="/domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/1_PROKKA/3_PB_illumina_NanoPore"


prokka --outdir $outdir --prefix $id $read1
