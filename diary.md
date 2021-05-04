Best assembly:
/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links/Pilon_illumina_Nanopore_PacBio.fasta


May 4th: <br>
Checkpoint - all good. will probably look into extra analyses from student manual and start answering questions. <br>
DESeq - Have done the analysis in RStudio. Am getting a lot of "0" values on base lines.. <br>

May ?
Managed to do HTSeq
Did blastn alignment with E. faecalis..
Tried to do mafft aligning of my dowloanded genomes - takes more than 20 hours so I will not try that again.. 


April 28/29: <br>
Still struggling with HTses and testing.. <br>
  - ended up using the original .bam files (not sorted by name) and removing most flags only using -t -f -i flags.. <br>
Working on synteny <br>
  - I have downloaded genomes of similar species and sort of an outsider<br>
    - Enterococcus faecium, Enterococcus faecalis, Enterococcus casseliflavus, Listeria monocytogenes. .fna(fasta sequence) and .gff files<br>
    - I have aligned Efaecalis and Efaecium with blastn <br>
    - I tried mafft aligning all the genomes but that is taking more than 20 hours so I will not try again.


April 25th: <br>
Approach to solve HTSeq missing mates - sort bam by name<br>
  - To do this I used script BAM_to_SAM_name_sort.sh which converts my bam file back to sam and the sorts based on name instead of on position..<br>
  - Then I tried HTSeq with many different flags! <br>
    - --secondary-alignments ignore --supplementary-alignments ignore -f bam<br>
    - -r name --secondary-alignments ignore --supplementary-alignments ignore -f bam<br>
    - 

April 23rd: <br>
Continued with BWA on RNA-seq (2 paired raw read files at a time - am not doing unpaired reads) and single Tn-Seq.
Did PROKKA on the "best" assembly.
Tried HTSeq - unsure about the "-r name" flag.. Removed the fasta sequences from the PROKKA gff file (kept 3226 lines).
  - How to call? "python -m HTSeq.scripts.count" or "htseq-count". pipe to .txt file? NOT WORKING!
  - "Warning: 27570122 reads with missing mate encountered. 27823721 alignment pairs processed."
  - 

April 21st:<br>
Finally success with BWA-mapping two of the RNA raw read files. <br>
And also finally managed to merge with github but lost 1 week of scripts.. (I think it was because it opened MERGE_MSG with vim and I didn't know how to save it.. ..I changed the config file to open with nano instead and then managed to force merge..)<br>


April 20th:<br>
I am struggling a lot with github merging.. push and pull.. <br>
I failed with running BCF on the pacbio aligned illumina and Nanopore reads (PB_aligned_ill_NP_on_Ref)
I started working on the RNA/transcriptome -> FastQC, they all seem to be trimmed already..
Tried BWA mapping of some RNA raw reads unto my favorite assembly - Pilon with PacBio+Nanopore+Illumina. It keeps failing..<br>



April 15th:<br>
I have downloaded a reference genome for E. faecium from [ncbi](https://ftp-ncbi-nlm-nih-gov.ezproxy.its.uu.se/genomes/refseq/bacteria/Enterococcus_faecium/representative/GCF_010120755.1_ASM1012075v1/) <br>
I ran PROKKA on PacBio assembly for annotation, visualized with artemis locally on my computer.<br>
I aligned my illumina and Nanopore reads onto the pacbio assembly with BWA(index and mem)<br>
I ran Pilon on my aligned illumina reads and PacBio assembly as reference to combine them.<br>
I ran Quast on all 7 assemblies (Canu: PacBio, Spades(contigs+scaffolds): illumina, Spades(contigs+scaffolds: illumina+Nanopore, Pilon: illumina+PacBio and illumina+Nanopore+PacBio)


April 14th:<br>
I couldn't run FastQC on the nanopore file, different types of reads - header and sequence. no score..<br>
I ran Spades on illumina reads alone but also on illumina together with Nanopore, and also illumina together with Pacbio, and spades on all three together.. <br>
I ran Quast to evaluate (version 5.0.2 was not available on rackham so I used version 4.5.4 instead)<br>
I couldn't figure out how to run MUMmer<br>

I did not correct base errors of canu PacBio assembly using BWA and illumina reads - maybe I will do this later!<br>

April 9th:<br>
I ran FastQC on illumina (jobID 4402490) - read 1 was looking good with high quality, but read 2 was not as good so I decided to trim using trimmomatic (jobID 4402701) and ran FastQc on the trimmed reads (jobID 4402761).<br>
Read 2 did not improve - so I will not use the trimmed by me reads but instead the original "clean" file.<br>
PacBio: I ran FastQC on PacBio (X0 files in jobID 4402936 and p0 files in jobID 4402934) which have really bad base quality as expected for PacBio. This was probably unnecessary as well since canu assembler does it's own quality check..<br>
Canu assembler: quality check, correct, trim, assemble<br>
Canu log (PacBio):
- Found 100836 reads
- Found 533813323 base
- 118.62 times coverage (based on 4.5M genome)
- Kmer: 
  --           0 (max occurrences)
  --   284160311 (total mers, non-unique)
  --    74359185 (distinct mers, non-unique)
  --           0 (unique mers)


April 8th:<br>
Today I did most of the project plan, timeline and folder organization before writing and running scripts tomorrow. <br>
Also collected the metadata from ENA<br>
PacBio names: m(movie)date_time_instrumentSN_SMRTbarcode_s1(set number)_p0(part number)<br>
