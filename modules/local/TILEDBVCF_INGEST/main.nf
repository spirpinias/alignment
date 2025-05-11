process TILEDBVCF_INGEST {
    
    secret "MY_ACCESS_KEY"
    secret "MY_SECRET_KEY"
    secret "TILEDB_REST_TOKEN"

    label "process_medium"

    container "leipzig/tiledbvcf-cli"

    input:
        path(gvcf_files)
    
    when:
        task.ext.when == null || task.ext.when

    script:
    """
    tiledbvcf \\
    store \\
    --uri s3://stephen-pirpinias-dev/TileDB-VCF-SRR \\
    --tiledb-config vfs.s3.aws_access_key_id=\$MY_ACCESS_KEY \\
    --tiledb-config vfs.s3.aws_secret_access_key=\$MY_SECRET_KEY \\
    --tiledb-config rest.token=\$TILEDB_REST_TOKEN \\
    ${gvcf_files}
    """
}