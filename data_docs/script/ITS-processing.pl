#!/usr/bin/perl -w
chomp($file_name = $ARGV[0]); # name of file containing processing and treatment structure
chomp($proc = $ARGV[1]); # number of processors
#system("mothur \"#make.contigs(file=$file_name, processors=$proc)\""); 
@name = split/\./,$file_name;
#system("rm $name[0].scrap.contigs.*");
#system("mothur \"#summary.seqs(fasta=$name[0].trim.contigs.fasta,processors=$proc)\"");
#system("mothur \"#screen.seqs(fasta=$name[0].trim.contigs.fasta, group=$name[0].contigs.groups,maxambig=0,maxhomop=8,minlength=265,maxlength=338,processors=$proc)\"");
#system("mothur \"#summary.seqs(fasta=$name[0].trim.contigs.good.fasta,processors=$proc)\"");