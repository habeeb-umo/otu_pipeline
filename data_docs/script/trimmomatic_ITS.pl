#!/usr/bin/perl -w
# inputting R1 file names
open INPUT, "<$ARGV[0]";
chomp(@files = <INPUT>);
close INPUT;

# inputing parameters
open PARM, "<$ARGV[1]";
chomp($parms = <PARM>);
close PARM;

system("mkdir PE U");
foreach $i (@files){
  $i=~ /(.*)-R1(.*)_R1(.*).fastq/;
  print($1."\n");
  system("java -jar /home/zabdo/Software/Trimmomatic-0.36/trimmomatic-0.36.jar PE $1-R1$2_R1$3.fastq $1-R2$2_R2$3.fastq PE/$1-p1.fq U/$1-u1.fq PE/$1-p2.fq U/$1-u2.fq $parms");
}

