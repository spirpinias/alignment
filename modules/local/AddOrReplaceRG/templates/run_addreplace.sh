#!/usr/bin/env bash

gatk AddOrReplaceReadGroups \
    -I !{alignments} \
    -O !{meta.id}_new.bam \
    --RGID '4' \
    --RGLB !{meta.id} \
    --RGPL 'ILLUMINA' \
    --RGPU 'Unit1' \
    --RGSM '20'

