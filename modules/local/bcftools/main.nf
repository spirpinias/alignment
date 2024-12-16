process bcftools {

    label "process_medium"
    
    container "biology/bcftools"
        
    publishDir "/home/stephen/Desktop/TEST/IndexVCF/"

    input:
        path(vcf_files)

    output:
        path(vcf_files)
        path('*')

    when:
        task.ext.when == null || task.ext.when

    script:    
        template 'run_bcf_tools.sh'
}
