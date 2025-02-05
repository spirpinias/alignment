process bwa_mem {

    label "process_medium"
    
    container "biology/bwa"
        
    input:
        tuple path(index), val(meta), path(reads)

    output:
        path('*.bam'), emit: bam
        tuple path('*.bam'), val(meta), emit : bam_val

    when:
        task.ext.when == null || task.ext.when

    script:    
        template 'run_bwa_mem.sh'
}
