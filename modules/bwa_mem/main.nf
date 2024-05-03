process bwa_mem {

    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10
    
	container "$REGISTRY_HOST/published/8df1a5c4-6068-4feb-a966-bfca076604ce:v1"

    publishDir "$RESULTS_PATH/Alignment"    

    input:
    tuple path(index), val(id), path(reads)

    output:
    path '*'

    shell:    
    template 'run_bwa_mem.sh'
}