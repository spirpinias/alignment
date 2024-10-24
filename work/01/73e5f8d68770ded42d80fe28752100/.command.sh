#!/usr/bin/env bash

fastp \
--in1 Sample4_R1.fastq.gz \
--in2 Sample4_R2.fastq.gz \
--out1 Sample4_R1.fastp.fastq.gz \
--out2 Sample4_R2.fastp.fastq.gz \
-j Sample4.json \
-h Sample4.html \
-w 2
