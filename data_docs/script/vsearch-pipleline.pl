#!/usr/bin/perl -w
chomp($fasta = $ARGV[0]);
chomp($dir = $ARGV[1]);
system("mkdir $dir");
# identifying otus
system("vsearch --cluster_fast $fasta --centroid vsearch.cent0.03.fa --id 0.97 --fasta_width 0 --sizeout --clusters $dir/a");
# detect chimeras
system("vsearch --uchime_denovo vsearch.cent0.03.fa --nonchimeras vsearch.cent0.03.uchime.fa --fasta_width 0 --sizeout");

