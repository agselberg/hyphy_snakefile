#!/bin/bash

clear

echo "Version: v0.1 --- "
echo "2023, COMPARE MODELS TO BUSTED-PH"
echo ""

# Set up the pipeline failure expectations.
set -euo pipefail

echo "Initialized --- "

# Uncomment if you want to generate an analysis DAG file.
#snakemake --forceall --dag | dot -Tpdf > Snakefile_DAG.pdf

config_file="config.json"
trees_value=$(jq -r '.trees' "$config_file")

if [ "$trees_value" == "included_gene" ]; then
    Snakefile="Snakefile_ge_tree"

elif [ "$trees_value" == "included_species" ]; then
    Snakefile="Snakefile_sp_tree"
	tree_dir=$(jq -r '.tree_directory' "$config_file") 
	tree_ext=$(jq -r '.tree_extension' "$config_file") 
	echo -e "$tree_dir \n$tree_ext"
	nwk_files=($(find "$tree_dir" -type f -name "*$tree_ext"))
	echo "$nwk_files"
	python scripts/clean-tree.py "$nwk_files" "$tree_dir/species_cleaned.$tree_ext"
	
elif [ "$trees_value" == "raxml" ]; then
    Snakefile="Snakefile_raxml"

else
    # Handle other cases if needed
    echo -e "Unknown value in config file for 'trees': $trees_value, \n\nPlease use one of the allowed options: 'raxml', 'included_species', or 'included_gene'. \nTHIS SNAKEFILE WILL EXIT, PLEASE FIX CONFIG FILE\n\n"
	exit
fi


echo "Creating 'logs' directory"
mkdir -p logs

echo "Executing HPC Snakemake command"

# Execute the Snakemake command
snakemake \
      -s  "$Snakefile" \
      --cluster-config cluster.json \
      --cluster "qsub -V -l nodes={cluster.nodes}:ppn={cluster.ppn} -q {cluster.name} -l walltime={cluster.walltime} -e logs -o logs" \
      --jobs 50 all \
      --rerun-incomplete \
      --keep-going \
      --reason \

# End Snakemake command

exit 0

# End of file.
