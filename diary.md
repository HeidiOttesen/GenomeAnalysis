April 15th:
I have downloaded a reference genome for E. faecium from [ncbi](https://ftp-ncbi-nlm-nih-gov.ezproxy.its.uu.se/genomes/refseq/bacteria/Enterococcus_faecium/representative/GCF_010120755.1_ASM1012075v1/)
I ran PROKKA on PacBio assembly for annotation, visualized with artemis locally on my computer.
I aligned my illumina reads onto the pacbio assembly with BWA (index and mem)
I ran Pilon on my aligned illumina reads and PacBio assembly as reference to combine them.


April 14th:
I couldn't run FastQC on the nanopore file, different types of reads - header and sequence. no score..
I ran Spades on illumina reads alone but also on illumina together with Nanopore, and also illumina together with Pacbio, and spades on all three together.. 
I ran Quast to evaluate (version 5.0.2 was not available on rackham so I used version 4.5.4 instead)
I couldn't figure out how to run MUMmer

I did not correct base errors of canu PacBio assembly using BWA and illumina reads - maybe I will do this later!

April 9th:
I ran FastQC on illumina (jobID 4402490) - read 1 was looking good with high quality, but read 2 was not as good so I decided to trim using trimmomatic (jobID 4402701) and ran FastQc on the trimmed reads (jobID 4402761).
Read 2 did not improve - so I will not use the trimmed by me reads but instead the original "clean" file.
PacBio: I ran FastQC on PacBio (X0 files in jobID 4402936 and p0 files in jobID 4402934) which have really bad base quality as expected for PacBio. This was probably unnecessary as well since canu assembler does it's own quality check..
Canu assembler: quality check, correct, trim, assemble
Canu log (PacBio):
- Found 100836 reads
- Found 533813323 base
- 118.62 times coverage (based on 4.5M genome)
- Kmer: 
  --           0 (max occurrences)
  --   284160311 (total mers, non-unique)
  --    74359185 (distinct mers, non-unique)
  --           0 (unique mers)


April 8th:
Today I did most of the project plan, timeline and folder organization before writing and running scripts tomorrow. 
Also collected the metadata from ENA
PacBio names: m(movie)date_time_instrumentSN_SMRTbarcode_s1(set number)_p0(part number)
