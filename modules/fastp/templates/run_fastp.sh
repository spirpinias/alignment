#!/usr/bin/env bash

fastp \
--in1 !{reads[0]} \
--in2 !{reads[1]} \
--out1 !{id}_R1.fastp.fastq.gz \
--out2 !{id}_R2.fastp.fastq.gz \
-j !{id}.json \
-h !{id}.html \
-w !{task.cpus}
