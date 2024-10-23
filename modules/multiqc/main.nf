process multiqc {
        
    label "process_medium"
    
    container "biology/multiqc"

    input: 
        path(zipz) 

    output:
        path '*.html'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_multiqc.sh'
}
