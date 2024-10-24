#!/usr/bin/env bash

bwa mem \
-t 2 \
saccro \
Sample4_R1.fastp.fastq.gz Sample4_R2.fastp.fastq.gz | samtools view -b - > Sample4.bam
