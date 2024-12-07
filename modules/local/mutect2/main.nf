process mutect2 {
        
    label "process_medium"
    
    container "broadinstitute/gatk"

    publishDir "/home/stephen/Desktop/TEST/VCF"

    input:
        tuple path(reference), path(index), path(dict), path(alignments), val(sample)

    output:
        path '*'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_mutect2.sh'
}