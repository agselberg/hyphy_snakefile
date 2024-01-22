# SNAKEFILE TO USE FOR BASIC HYPHY ANALYSES

### This application is currently designed to run in an HPC environment.
### There is an assumption that the freely availible [Anaconda](https://anaconda.org/) software has been installed on your machine, as well as the [HyPhy (MPI enabled)](https://github.com/veg/hyphy) package. The error filtering script requires the hyphy develop branch
Save hyphy and hyphy-analyses in your home directory

To install: 

### Step 1: clone the repository
`git clone https://github.com/agselberg/hyphy_snakefile.git`

`cd hyphy_snakefile`

### Step 2: set the enviornment 
Use the following commands to set up the conda environment before starting the analysis:

`conda env create -f environment.yml`

`conda activate HYPHY_SNAKEMAKE`

### Step 3: Set config 
1. Set full paths for data directories and set extensions for data files.
2. Specify if gene trees or species trees will be used:
- GENE TREES:
	- Update config file to `"trees" : "gene"`
	- Include one gene tree for each msa file with the same basename (ex: gene1.fasta and gene1.nwk)
- SPECIES TREES:
	- Update config file to `"trees" : "species"`
	- There should be one species tree in the specified tree directory
- BUILD TREES with RAXML:
	- Update config file to `"trees" : "raxml"

### Step 4: Choose HyPhy models to run
The specified snakefile will run the following models: BUSTED-E, BUSTED-PH, Contrast-FEL, aBSREL, MEME, RELAX. To skip a model, comment out undesired models in `rule all` in the Snakefile. 

### Step 5: 
Run Snakemake:

`bash RUN_SNAKEFILE.sh`
