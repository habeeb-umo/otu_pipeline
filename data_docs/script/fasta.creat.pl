#!/usr/bin/perl -w
# Reading file with file names and groups (groups are first column)
open IN, "<$ARGV[0]";
chomp(@files = <IN>);
close IN;

chomp($file_name = $ARGV[1]);
chomp($file_name2 = $ARGV[2]);

# group and fasta files
open GROUP, ">$file_name";
open OUT, ">$file_name2";
foreach $i (@files){
 @temp = split /\s+/, $i;
 print("$temp[0]\t$temp[1]\n");
 open IN, "<$temp[1]";
 chomp(@seq = <IN>);
 close IN;
 for($j = 0;$j <= $#seq;$j += 4){
  $seq[$j]=~ s/:/\_/g;
  $seq[$j]=~ s/^@/>/;
  print OUT "$seq[$j]\n$seq[$j+1]\n";
  print GROUP "$seq[$j]\t$temp[0]\n";
 }
}
close OUT;
close GROUP;

#@temp = split /,/,$file_name2;
#system("vsearch --derep_fulllength $temp[0].fa --sizeout -relabel_sha1 --fasta_width 0 --output $temp[0].derep.fa");
