process multiqc {
        
    label "process_medium"

    input: 
        path(jsons) 

    output:
        path '*'

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_multiqc.sh'
}
