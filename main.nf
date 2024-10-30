#!/usr/bin/env nextflow

include { example } from './workflows/example'

workflow {

    // Ingest the Samplesheet and Map the Reads

    reads = Channel
        .fromPath(params.sample)
        .splitCsv(header:true)
        .map { 
                row -> 
                if (row.fastq2)
                    [[id:row.id, single_end:false], [file(row.fastq1), file(row.fastq2)]]
                else
                    [[id:row.id, single_end:true], [file(row.fastq1)]]
        }
    
    // Pass to the Pipeline
    
    example(reads)
}