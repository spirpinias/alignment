#!/usr/bin/env nextflow

params.reads = Channel
    .fromPath(params.sample)
    .splitCsv(header:true)
    .map { row -> 
        [row.id, [file(row.fastq1), file(row.fastq2)]]
    }


include { fastqc } from '../alignment/modules/fastqc'
include { multiqc } from '../alignment/modules/multiqc'
include { bwa_index } from '../alignment/modules/bwa_index'
include { bwa_mem } from '../alignment/modules/bwa_mem'

workflow {
    //fastqc(params.reads) | collect | multiqc
    bwa_index(params.reference) | toList | combine(params.reads) | bwa_mem
    
}
