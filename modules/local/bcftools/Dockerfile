FROM mambaorg/micromamba

RUN micromamba install --yes --name base -c bioconda -c conda-forge \
      bcftools

RUN micromamba clean --all --yes