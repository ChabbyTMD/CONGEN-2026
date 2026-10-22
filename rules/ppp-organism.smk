rule ppp_organism:
    input:
        f"{workflow.basedir}/envs/ppp-env.yaml",
        input_notebook=f"{workflow.basedir}/notebooks/ppp-popgen.ipynb",
        kernel_set="results/.kernel.set",
    output:
        output_notebook="results/{organism}/popgen.ipynb",
    conda:
        "../envs/ppp-env.yaml"
    log:
        "logs/{organism}_set_organism.log",
    params:
        organism=config['organism'],
    notebook:
        "../notebooks/ppp-popgen.ipynb"
    # shell:
    #     """
    #     papermill {input.input_notebook} {output.output_notebook} -k py-popgen -p organism {params.organism} 2> {log}
    #     """