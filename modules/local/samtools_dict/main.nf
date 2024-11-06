process samtools_dict {
    
    label "process_medium"

    container "ljishen/samtools"

    input:
        path(reference)

    output:
        path('*.dict'), emit: dict

    when:
        task.ext.when == null || task.ext.when
    
    shell:
        template 'run_samtools.sh'
}
