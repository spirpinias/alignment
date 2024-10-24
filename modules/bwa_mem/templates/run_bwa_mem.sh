#!/usr/bin/env bash

bwa mem \
-t !{task.cpus} \
!{params.prefix_genome} \
!{reads} | samtools view -b - > !{meta.id}.bam