process bwa_index {
    
    label "process_medium"

    container "biology/bwa"

    input:
        path(reference)

    output:
        tuple path('*.amb'), path('*.ann'), path('*.bwt'), path('*.pac'), path('*.sa')

    when:
        task.ext.when == null || task.ext.when
    
    shell:
        template 'run_bwa_index.sh'
}
