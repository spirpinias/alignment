
include { fastp } from '../modules/local/fastp'
include { multiqc } from '../modules/local/multiqc'
include { bwa_index } from '../modules/local/bwa_index'
include { bwa_mem } from '../modules/local/bwa_mem'
include { samtools_ref_index } from '../modules/local/samtools_ref_index'
include { samtools_dict } from '../modules/local/samtools_dict'
include { mutect2 } from '../modules/local/mutect2'
include { AddOrReplaceRG } from '../modules/local/AddOrReplaceRG'
include { bcftools } from '../modules/local/bcftools'
include { TILEDBVCF_CREATE } from '../modules/local/TILEDBVCF_CREATE'

workflow example {

    take:
        reads
        reference
        uri

    main:

        // Create the TileDB-VCF Array
        TILEDBVCF_CREATE(uri)
        
        // Clean The Reads and MultiQC
        clean_reads = fastp(reads)
        clean_reads.json | collect | multiqc
        
        // Index and Create Dictionaries for GATK
        index = samtools_ref_index(reference)
        dict = samtools_dict(reference)

        // Generate the Alignments and Add Read Groups
        alignments = bwa_index(reference) | toList | combine(clean_reads.reads) | bwa_mem
        clean_alignments = AddOrReplaceRG(alignments.bam_val)

       // Create the VCF
        vcf = reference | toList | combine(index.index) | combine(dict.dict) | combine(clean_alignments) | mutect2

        // Index and Ingest the gVCF
        index_vcf = vcf.vcf | bcftools

    publish:   
        
        index_vcf >> 'VCF'            
        alignments >> 'Alignments'
}
