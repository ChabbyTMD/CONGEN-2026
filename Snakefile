import os
import shutil


include: "rules/common.smk"


rule all:
    input:
        "results/.kernel.set",
        ppp_outputs