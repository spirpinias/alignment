#!/usr/bin/env bash

if [ "!{meta.single_end}" == "true" ];
then
    fastp \
    --in1 !{reads[0]} \
    --out1 !{meta.id}_R1.fastp.fastq.gz \
    -j !{meta.id}.json \
    -h !{meta.id}.html \
    -w !{task.cpus}
else
    fastp \
    --in1 !{reads[0]} \
    --in2 !{reads[1]} \
    --out1 !{meta.id}_R1.fastp.fastq.gz \
    --out2 !{meta.id}_R2.fastp.fastq.gz \
    -j !{meta.id}.json \
    -h !{meta.id}.html \
    -w !{task.cpus}
fi