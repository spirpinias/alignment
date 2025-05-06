process bcftools {

    label "process_medium"
    
    container "biology/bcftools"
        
    input:
        path(vcf_files)

    output:
        path('*')

    when:
        task.ext.when == null || task.ext.when

    script:    
        template 'run_bcf_tools.sh'
}
