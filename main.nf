#!/usr/bin/env nextflow

params.reference = Channel
    .fromPath(params.sequence, type: 'file', checkIfExists: true)

params.reads = Channel
    .fromPath(params.sample)
    .splitCsv(header:true)
    .map { row -> 
        [row.id, [file(row.fastq1), file(row.fastq2)]]
    }


include { fastqc } from '../pipeline/modules/fastqc'
include { multiqc } from '../pipeline/modules/multiqc'
include { bwa_index } from '../pipeline/modules/bwa_index'
include { bwa_mem } from '../pipeline/modules/bwa_mem'

workflow {
    fastqc(params.reads) | collect | multiqc
    bwa_index(params.reference) | toList | combine(params.reads) | bwa_mem
}
