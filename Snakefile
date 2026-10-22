import os
import shutil


include: "rules/common.smk"
include: "rules/ppp-organism.smk"


rule all:
    input:
        "results/.kernel.set",
        ppp_outputs,