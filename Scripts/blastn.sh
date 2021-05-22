#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Blast_L_monocyt_vs_E745
#SBATCH -o Blast_L_monocytogenes_vs_E745.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast/2.11.0+


cat $0
query=/domus/h1/heidio/GenomeAnalysis/05_synteny/genomes_other/L_monocytogenes_GCF_000196035.1_ASM19603v1_genomic.fna
subject=/domus/h1/heidio/GenomeAnalysis/03_Assembly/5_Pilon_combined/Pilon_illumina_Nanopore_PacBio.fasta
#id="Megablast_E745_allDNAPilon_apr2021"

#E=1e-20

#Megablast option
#blastn -db nt -query $query -num_threads 4  -task megablast  -evalue $E -outfmt '6 qseqid qlen staxids bitscore std slen sscinames sskingdoms stitle' -out ${id}.tab

blastn -query $query -subject $subject -outfmt '6' > blast_align_EfaeciumE745_L_monocytogenes.fasta
