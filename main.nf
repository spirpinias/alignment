#!/usr/bin/env nextflow

include { example } from './workflows/example'

workflow {
    example()
}