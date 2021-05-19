#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J Blast_Efaecalis_vs_E745
#SBATCH -o Blast_Efaecalis_vs_E745.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast/2.11.0+


cat $0
subject=/domus/h1/heidio/GenomeAnalysis/05_synteny/genomes_other/E_faecalis_DB/E_faecalis_GCF_003319815.1_ASM331981v1_genomic.fna
query="/domus/h1/heidio/GenomeAnalysis/03_Assembly/5_Pilon_combined/Pilon_illumina_Nanopore_PacBio.fasta"
#id="Megablast_E745_allDNAPilon_apr2021"

#E=1e-20

#Megablast option
#blastn -db nt -query $query -num_threads 4  -task megablast  -evalue $E -outfmt '6 qseqid qlen staxids bitscore std slen sscinames sskingdoms stitle' -out ${id}.tab

blastn -query $query -subject $subject > blast_align_Efaecalis_EfaeciumE745.fasta