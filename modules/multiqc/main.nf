process multiqc {
        
    label "process_medium"
    
    container "biology/multiqc"
    publishDir "/home/stephen/Desktop/TEST"

    input: 
        path(jsons) 

    output:
        path '*'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_multiqc.sh'
}
