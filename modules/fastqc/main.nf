process fastqc {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10

    container "community.wave.seqera.io/library/fastqc:0.12.1--5cfd0f3cb6760c42"
        
    input:
        tuple val(id), path(reads)

    output:
        path '*.zip'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_fastqc.sh'
}
