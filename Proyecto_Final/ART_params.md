##PARÁMETROS DE ART

  -1   --qprof1   the first-read quality profile

  -2   --qprof2   the second-read quality profile

  -amp --amplicon amplicon sequencing simulation

  -c   --rcount   number of reads/read pairs to be generated per sequence/amplicon (not be used together with -f/--fcov)

  -d   --id       the prefix identification tag for read ID

  -ef  --errfree  indicate to generate the zero sequencing errors SAM file as well the regular one

**NOTE: the reads in the zero-error SAM file have the same alignment positions as those in the regular SAM file, but have no sequencing errors

  -f   --fcov     the fold of read coverage to be simulated or number of reads/read pairs generated for each amplicon

  -h   --help     print out usage information

  -i   --in       the filename of input DNA/RNA reference

  -ir  --insRate  the first-read insertion rate (default: 0.00009)

  -ir2 --insRate2 the second-read insertion rate (default: 0.00015)

  -dr  --delRate  the first-read deletion rate (default:  0.00011)

  -dr2 --delRate2 the second-read deletion rate (default: 0.00023)

  -k   --maxIndel the maximum total number of insertion and deletion per read (default: up to read length)

  -l   --len      the length of reads to be simulated

  -m   --mflen    the mean size of DNA/RNA fragments for paired-end simulations

  -mp  --matepair indicate a mate-pair read simulation

  -M  --cigarM    indicate to use CIGAR 'M' instead of '=/X' for alignment match/mismatch

  -nf  --maskN    the cutoff frequency of 'N' in a window size of the read length for masking genomic regions

**NOTE: default: '-nf 1' to mask all regions with 'N'. Use '-nf 0' to turn off masking

  -na  --noALN    do not output ALN alignment file

  -o   --out      the prefix of output filename

  -p   --paired   indicate a paired-end read simulation or to generate reads from both ends of amplicons

**NOTE: art will automatically switch to a mate-pair simulation if the given mean fragment size >= 2000

  -q   --quiet    turn off end of run summary

  -qL  --minQ     the minimum base quality score

  -qU  --maxQ     the maxiumum base quality score

  -qs  --qShift   the amount to shift every first-read quality score by

  -qs2 --qShift2  the amount to shift every second-read quality score by

**NOTE: For -qs/-qs2 option, a positive number will shift up quality scores (the max is 93) that reduce substitution sequencing errors and a negative number will shift down quality scores that increase sequencing errors. If shifting scores by x, the error rate will be 1/(10^(x/10)) of the default profile.

  -rs  --rndSeed  the seed for random number generator (default: system time in second)

**NOTE: using a fixed seed to generate two identical datasets from different runs

  -s   --sdev     the standard deviation of DNA/RNA fragment size for paired-end simulations

  -sam --samout   indicate to generate SAM alignment file

  -sp  --sepProf  indicate to use separate quality profiles for different bases (ATGC)

  -ss  --seqSys   The name of Illumina sequencing system of the built-in profile used for simulation