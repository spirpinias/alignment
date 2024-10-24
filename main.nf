#!/usr/bin/env nextflow

params.reads = Channel
    .fromPath(params.sample)
    .splitCsv(header:true)
    .map { 
            row -> 
            if (row.fastq2)
                [[id:row.id, single_end:false], [file(row.fastq1), file(row.fastq2)]]
            else
                [[id:row.id, single_end:true], [file(row.fastq1)]]
    }


include { fastp } from '../alignment/modules/fastp'
include { multiqc } from '../alignment/modules/multiqc'
include { bwa_index } from '../alignment/modules/bwa_index'
include { bwa_mem } from '../alignment/modules/bwa_mem'

workflow {
    clean_reads=fastp(params.reads)
    clean_reads.json | collect | multiqc
    bwa_index(params.reference) | toList | combine(clean_reads.reads) | bwa_mem
}
