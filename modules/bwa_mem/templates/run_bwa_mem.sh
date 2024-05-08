#!/usr/bin/env bash

reads=$(find -L ./ -name "*_R1.fastq.gz" | head -1)
index_prefix=$(find -L ./ -name "*.amb")

prefix=$(basename -s _R1.fastq.gz $reads)
index=$(basename -s .amb $index_prefix)

bwa mem \
-t !{task.cpus} \
$index \
!{reads} | samtools view -b - > $prefix.bam
