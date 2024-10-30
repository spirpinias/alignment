
include { fastp } from '../modules/local/fastp'
include { multiqc } from '../modules/local/multiqc'
include { bwa_index } from '../modules/local/bwa_index'
include { bwa_mem } from '../modules/local/bwa_mem'

workflow example {

    take:
        reads

    main:
        clean_reads=fastp(reads)
        clean_reads.json | collect | multiqc
        bwa_index(params.reference) | toList | combine(clean_reads.reads) | bwa_mem

}
