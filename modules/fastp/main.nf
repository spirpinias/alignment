process fastp {

    label "process_medium"

    container "nanozoo/fastp"
        
    input:
        tuple val(id), path(reads)

    output:
        tuple val(id), path('*.fastp.fastq.gz'), emit: reads
        path('*.json'), emit: json
        path('*.html'), emit: html

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_fastp.sh'
}
