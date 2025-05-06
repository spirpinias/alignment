process TILEDBVCF_CREATE {
    publishDir 's3://stephen-pirpinias-dev'
        
    label "process_medium"

    input: 
        val(uri) 
    
    output:
        path "${uri}", type:'dir'
    
    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_vcf.sh'
}