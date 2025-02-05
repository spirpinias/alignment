FROM mambaorg/micromamba

RUN micromamba install --yes --name base -c bioconda -c conda-forge \
      python=3.9.1 \
      samtools \
      bwa==0.7.17

RUN micromamba clean --all --yes