process TILEDBVCF_CREATE {
        
    label "process_medium"

    input: 
        path(uri) 

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_vcf.sh'
}