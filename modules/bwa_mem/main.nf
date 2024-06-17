process bwa_mem {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10
    
    container "community.wave.seqera.io/library/pip_bwa:5e24b616f03797f5"

    publishDir "$RESULTS_PATH/Alignment"    

    input:
        tuple path(index), val(id), path(reads)

    output:
        path '*'

    when:
        task.ext.when == null || task.ext.when

    shell:    
        template 'run_bwa_mem.sh'
}
