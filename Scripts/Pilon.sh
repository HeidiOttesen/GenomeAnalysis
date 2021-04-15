#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Pilon
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load Pilon/1.24
module load java/sun_jdk1.8.0_151


ref="/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links/PacBio.contigs.fasta"
mapped_reads="/domus/h1/heidio/GenomeAnalysis/03_Assembly/4_BWA/BWA_illumina_on_PacBio_sorted.bam"
outdir="/domus/h1/heidio/GenomeAnalysis/03_Assembly/5_Pilon_combined/"
id="Pilon_illumin_PacBio"

java -jar $PILON_HOME/pilon.jar --genome $ref --frags $mapped_reads --outdir $outdir --output $id
