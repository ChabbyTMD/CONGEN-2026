# ConGen 2026 PPP Snakemake Demo

This repo is snakemake pipeline that wraps the PPP suite of tools for the ConGen 2026 Workshop.

## Prerequisites

You will need to activate the snakemake conda environment on the server or your local machine

```bash

conda activate snakemake

```

> Ensure that Snakemake >8.0 is installed

## Setup

All required input files must be defined in the workflow [`config.yaml`](config/config.yaml). By default, the workflow declares paths relative to the repository's root directory. However, relative paths or absolute paths to data in other locations is acceptable. 

> NOTE: All output paths must be located in the same directory.


## Running the workflow

To ensure you have configured the workflow correctly, first perform a dry run by executing the following command.

```bash

snakemake -np --cores 1 --use-conda --rerun-incomplete

```


Once you have confirmed you dry run completes without errors, perform a run with;

```bash
snakemake -np --cores 1 --use-conda --rerun-incomplete
```


## Inspecting outputs

By default, all outputs BED files are located in the `ppp-outputs` directory unless otherwise declared in the `config.yaml` file. Additionally, inspect the jupyter notebook at the generated `results/{organism}` directory for all the stats at a glance.


## Troublshooting and Help.

Raise and issue on the repo for any assistance.