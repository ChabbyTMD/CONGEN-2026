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
        data_dir=config['data_dir'],
        model_file=config['model_file'],
        model=config['model'],
        main_vcf_name=config['main_vcf_name'],
        stat_file_name=config['stat_file_name'],
        filtered_vcf_name=config['filtered_vcf_name'],
        int_bed_file=config['int_bed_file'],
        target_loci_file=config['target_loci_file'],
        tajimaD_file=config['tajimaD_file'],
        windowed_pi_file=config['windowed_pi_file'],
        loci=config['loci'],
        statistic_window_size=config['statistic_window_size'],
        statistic_window_step=config['statistic_window_step'],
    shell:
        """
        # Execute papermill
        papermill {input.input_notebook} {output.output_notebook} -k py-popgen \
            -p organism {params.organism} \
            -p data_dir {params.data_dir} \
            -p stat_file_name {params.stat_file_name} \
            -p main_vcf_name {params.main_vcf_name} \
            -p filtered_vcf_name {params.filtered_vcf_name} \
            -p int_bed_file {params.int_bed_file} \
            -p target_loci_file {params.target_loci_file} \
            -p tajimaD_file {params.tajimaD_file} \
            -p windowed_pi_file {params.windowed_pi_file} \
            -p loci {params.loci} \
            -p model_file {params.model_file} \
            -p model {params.model} \
            -p statistic_window_size {params.statistic_window_size} \
            -p statistic_window_step {params.statistic_window_step} \
            2> {log}
        """