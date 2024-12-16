process AddOrReplaceRG {
        
    label "process_medium"
    
    container "broadinstitute/gatk"

    input:
        tuple path(alignments), val(meta) 

    output:
        tuple path('*.bam'), val(meta.id)

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_addreplace.sh'
}
