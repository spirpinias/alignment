process fastp {

    label "process_medium"

    container "nanozoo/fastp"
        
    input:
        tuple val(meta), path(reads)

    output:
        tuple val(meta), path('*.fastp.fastq.gz'), emit: reads
        path('*.json'), emit: json
        path('*.html'), emit: html

    when:
        task.ext.when == null || task.ext.when

    script:
        template 'run_fastp.sh'
}
