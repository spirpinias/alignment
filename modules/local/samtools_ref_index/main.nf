process samtools_ref_index {
    
    label "process_medium"

    container "ljishen/samtools"

    input:
        path(reference)

    output:
        path('*.fai'), emit: index

    when:
        task.ext.when == null || task.ext.when
    
    shell:
        template 'run_samtools.sh'
}
