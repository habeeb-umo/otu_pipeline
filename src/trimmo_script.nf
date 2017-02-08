#!/usr/bin/env nextflow



process trimmoClean

"""
java -jar ~/bin/trimmomatic.jar PE -threads 10 -trimlog log.txt 3104_0_FALL13_1391f_R1.fq 3104_0_FALL13_1391f_R2.fq lane1_forward_paired.fq lane1_forward_unpaired.fq lane1_reverse_paired.fq lane1_reverse_unpaired.fq ILLUMINACLIP:primers.fa:2:30:10 LEADING:15 TRAILING:15 SLIDINGWINDOW:4:25 MINLEN:100

""" 
