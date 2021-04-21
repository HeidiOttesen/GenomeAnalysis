#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J PROKKA
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load prokka/1.45-5b58020

ref="/domus/h1/heidio/GenomeAnalysis/03_Assembly/0_ReferenceGenome/Efaecium_ref.fna"
read1=$1
read2=$2
id="PacBio_illumina"
outdir="/domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/1_PROKKA/2_PacBio_illumina"


prokka --outdir $outdir --prefix $id $read1