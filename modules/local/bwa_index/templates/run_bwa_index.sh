#!/usr/bin/env bash

bwa index \
-p ${params.prefix_genome} \
${reference}
