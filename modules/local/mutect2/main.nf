process mutect2 {
        
    publishDir "${params.outdir}/VCF"
    
    label "process_medium"
    
    container "broadinstitute/gatk"

    input:
        tuple path(reference), path(index), path(dict), path(alignments), val(sample)

    output:
        path('*gvcf.gz'), emit: vcf

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_mutect2.sh'
}