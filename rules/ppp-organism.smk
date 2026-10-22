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
    # notebook:
    #     "../notebooks/ppp-popgen.ipynb"
    shell:
        """
        python -c "import nbformat; nb=nbformat.read('{input.input_notebook}', as_version=4); 'kernelspec' in nb.metadata or nb.metadata.update({'kernelspec': {'display_name': 'Python 3', 'language': 'python', 'name': 'python3'}}); nbformat.write(nb, '{input.input_notebook}')"

        # Execute papermill
        papermill {input.input_notebook} {output.output_notebook} -k py-popgen -p organism {params.organism} 2> {log}
        """