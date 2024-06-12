process multiqc {
        
    cpus = { 1 * task.attempt }
    memory { 1.GB * task.attempt }
    errorStrategy { task.exitStatus in 137..140 ? 'retry' : 'ignore' }
    maxRetries 10
    
    container "$REGISTRY_HOST/published/5960f4da-36d4-415f-9619-c578035da1fc:v1"
    
    publishDir "$RESULTS_PATH/MultiQC"    

    input: 
        path(zipz) 

    output:
        path '*.html'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_multiqc.sh'
}
