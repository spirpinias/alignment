process bwa_mem {

    label "process_medium"
    
    container "biology/bwa"
        
    publishDir "/home/stephen/Desktop/TEST"

    input:
        tuple path(index), val(meta), path(reads)

    output:
        path '*'

    when:
        task.ext.when == null || task.ext.when

    shell:    
        template 'run_bwa_mem.sh'
}
