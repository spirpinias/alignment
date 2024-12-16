#!/usr/bin/env bash

bwa mem \
-t ${task.cpus} \
${params.prefix_genome} \
${reads} | samtools view -b - | samtools sort - > ${meta.id}.bam