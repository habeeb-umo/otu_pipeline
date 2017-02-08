#!/usr/bin/perl -w

## load the vsearch file
open VSEARCH, "<$ARGV[0]";
chomp(@seq = <VSEARCH>);
close VSEARCH;

## load otu names: first letter
chomp($otu = $ARGV[1]);

## create a hash with all names
$k = 0;
for($i = 0; $i <= $#seq;$i= $i + 2){
  @tmp = split/;/,$seq[$i];
  $vsearch{$tmp[0]} = "a$k";
  print $vsearch{$tmp[0]}."\n";
  $k = $k + 1;
}

## removing chimeras
# read the non-chimera vsearch file
open VSEARCH, "<$ARGV[2]";
chomp(@seq1 = <VSEARCH>);
close VSEARCH;

open OTU, ">$ARGV[3]";
for($i = 0; $i <= $#seq1; $i = $i + 2){
  @tmp = split/;/,$seq1[$i];
  print OTU $vsearch{$tmp[0]}."\n";
}
close OTU;
