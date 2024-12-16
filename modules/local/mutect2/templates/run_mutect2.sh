#!/usr/bin/env bash
    

samtools index ${alignments}

gatk Mutect2 \
    -R ${reference} \
    -I ${alignments} \
    -O ${sample}.vcf.gz