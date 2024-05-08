process bwa_mem {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10
    
    container "quay.io/biocontainers/bwa"

    publishDir "$RESULTS_PATH/Alignment"    

    input:
    tuple path(index), val(id), path(reads)

    output:
    path '*'

    shell:    
    template 'run_bwa_mem.sh'
}
