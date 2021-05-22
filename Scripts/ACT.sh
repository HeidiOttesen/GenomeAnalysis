#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 15:00 --qos=short
#SBATCH -J ACT_E.faec.alis.ium
#SBATCH -o ACT_tab_blast_E.faecalis_E.faecium.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load artemis/16.0.0

cat $0
seq2=/domus/h1/heidio/GenomeAnalysis/05_synteny/genomes_other/E_faecalis_DB/E_faecalis_GCF_003319815.1_ASM331981v1_genomic.fna
seq2=/domus/h1/heidio/GenomeAnalysis/03_Assembly/5_Pilon_combined/Pilon_illumina_Nanopore_PacBio.fasta
blast=/domus/h1/heidio/GenomeAnalysis/05_synteny/1_align/blast_align_tab_Efaecalis_EfaeciumE745.fasta
#id="ACT_blast_E.faecalis_E.faecium"

act -mx500m -ms20m -noverify $seq1 $blast $seq2
