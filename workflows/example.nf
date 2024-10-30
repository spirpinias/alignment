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


include { fastp } from '../modules/local/fastp'
include { multiqc } from '../modules/local/multiqc'
include { bwa_index } from '../modules/local/bwa_index'
include { bwa_mem } from '../modules/local/bwa_mem'

workflow example {

    clean_reads=fastp(params.reads)
    clean_reads.json | collect | multiqc
    bwa_index(params.reference) | toList | combine(clean_reads.reads) | bwa_mem

}
