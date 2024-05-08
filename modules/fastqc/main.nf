process fastqc {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10

    container "$REGISTRY_HOST/published/a77487b1-1307-43b8-8f5a-b18255789cf3:v4"
        
    input:
    tuple val(id), path(reads)

    output:
    path '*.zip'

    shell:
    template 'run_fastqc.sh'
}
