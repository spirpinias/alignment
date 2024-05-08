process fastqc {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10

    container "quay.io/biocontainers/fastqc"
        
    input:
    tuple val(id), path(reads)

    output:
    path '*.zip'

    shell:
    template 'run_fastqc.sh'
}
