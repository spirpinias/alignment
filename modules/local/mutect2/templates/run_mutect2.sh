#!/usr/bin/env bash
    
samtools index ${alignments}

gatk Mutect2 \
    -ERC 'GVCF' \
    -R ${reference} \
    -I ${alignments} \
    -O ${sample}.gvcf.gz