process fastqc {

    label "process_medium"

    container "pegi3s/fastqc"
        
    input:
        tuple val(id), path(reads)

    output:
        path '*.zip'

    when:
        task.ext.when == null || task.ext.when

    shell:
        template 'run_fastqc.sh'
}
