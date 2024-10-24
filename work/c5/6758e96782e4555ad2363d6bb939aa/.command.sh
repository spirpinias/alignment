#!/usr/bin/env bash

bwa mem \
-t 2 \
saccro \
Sample2_R1.fastp.fastq.gz Sample2_R2.fastp.fastq.gz | samtools view -b - > Sample2.bam
