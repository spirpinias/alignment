process bwa_index {
    
    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10

    container "quay.io/biocontainers/bwa"

    input:
    path(reference)

    output:
    tuple path('*.amb'), path('*.ann'), path('*.bwt'), path('*.pac'), path('*.sa')

    when:
    task.ext.when == null || task.ext.when

    shell:
    template 'run_bwa_index.sh'
}
