rule set_kernel:
    input:
        f"{workflow.basedir}/envs/ppp-env.yaml",
    output:
        touch("results/.kernel.set"),
    conda:
        f"{workflow.basedir}/envs/ppp-env.yaml"
    log:
        "logs/set_kernel.log",
    shell:
        """
        python -m ipykernel install --user --name=py-popgen 2> {log}
        """

def ppp_outputs(wildcards):
    outputs=[]

    output.extend(
        expand(
            [
                "results/{organism}/popgen.ipynb",
            ], 
            organism=config["organism"],
        )
    )

    return outputs