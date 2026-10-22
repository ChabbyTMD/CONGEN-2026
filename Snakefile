configfile: "config/config.yaml"
import os
import shutil

include: "rules/common.smk"
include: "rules/ppp-organism.smk"

organism = config['organism']

rule all:
    input:
        ppp_outputs,