#!/usr/bin/env bash

fastp \
--in1 Sample2_R1.fastq.gz \
--in2 Sample2_R2.fastq.gz \
--out1 Sample2_R1.fastp.fastq.gz \
--out2 Sample2_R2.fastp.fastq.gz \
-j Sample2.json \
-h Sample2.html \
-w 2
