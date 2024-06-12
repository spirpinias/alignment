process bwa_index {
    
    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10

    container "$REGISTRY_HOST/published/95a4a8f5-6619-44d8-8ee0-551ec4172ad9:v2"

    input:
        path(reference)

    output:
        tuple path('*.amb'), path('*.ann'), path('*.bwt'), path('*.pac'), path('*.sa')

    when:
        task.ext.when == null || task.ext.when
    
    shell:
        template 'run_bwa_index.sh'
}
