!#/usr/bin/perl -w

## creating the splitting table (ARGV[0]) should be name of the treat.file similar to that of mothur
# while the otu file includes the clusters separated using vsearch
open TRT, "<$ARGV[0]";
chomp(@trt=<TRT>);
close TRT;
open OTU, "<$ARGV[1]";
chomp(@otu=<OTU>);
close OTU;

## Here we create a hash with keys describing the treatment levels and the otus and set the count to zero
$k = 0;
foreach $i (@trt){
 @tmp = split/\s+/,$i;
 $key[$k] = $tmp[0];
 foreach $j (@otu){
  $treat{$key[$k]}{$j} = 0;
  print $tmp[0]."\t".$j."\t".$treat{$tmp[0]}{$j}."\n";
 }
 $k++;
}

## creating the hash for the seq names using the .group file where we use the sequence name as a key and 
# treatment level from that file as input for the group using this key
open GROUP, "<$ARGV[2]";
chomp(@group=<GROUP>);
close GROUP;
foreach $i (@group){
  @tmp = split/\s+/,$i;
  $tmp[0] = ">$tmp[0]";
  $group{$tmp[0]} = $tmp[1];
}

## counting: now we combine both we read in the cluster files (otu files) and then go through the sequences 
# within this file $cls[$i] and use these as group keys to identify the treatment where they came from
# at that otu $j and add 1 to the hash wheneer we have a match
chomp($dir = $ARGV[3]);
foreach $j (@otu){
  open CLS, "<$dir/$j";
  chomp(@cls=<CLS>);
  close CLS;
  for($i = 0; $i <= $#cls; $i = $i + 2){
    $treat{$group{$cls[$i]}}{$j} += 1;
  }
}

## output: a comma separated table of counts (raws are treatments and columns are otus)
chomp($out = $ARGV[4]);
open OUT, ">$out";
open OUT, ">>$out";
print OUT join(",",@otu)."\n";
foreach $i (@key){
 print OUT "$i"; 
 foreach $j (@otu){
  print OUT ",$treat{$i}{$j}";
 }
 print OUT "\n";
}
