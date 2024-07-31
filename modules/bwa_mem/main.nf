process bwa_mem {

    label "process_medium"
    
    container "quay.io/biocontainers/bwa"

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
