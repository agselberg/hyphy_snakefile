# SNAKEFILE TO USE FOR BASIC HYPHY ANALYSES

## This application is currently designed to run in an HPC environment.
## There is an assumption that the freely availible [Anaconda](https://anaconda.org/) has been installed on your machine, as well as [HyPhy (MPI enabled)](https://github.com/veg/hyphy).

To install: 

### Step 1: clone the repository
`git clone https://github.com/agselberg/hyphy_snakefile.git`

`cd hyphy_snakefile`

### Step 2: set the enviornment 
Use the following commands to set up the conda environment before starting the analysis:

`conda env create -f environment.yml`

`conda activate HYPHY_SNAKEMAKE`

### Step 3: Set config 
- Specify if gene trees will be used ("trees" : "included_species"), or if one master species will be used("trees" : "included_species"), or if raxml will be used to make new gene trees ("trees" : "raxml"). 
- Please use unlabled tree files with corresponding trait files.
- Set full paths for hyphy files and data directories, set extensions for data files.

### Step 4: Choose HyPhy models to run
The specified snakefile will run the following models: BUSTED-E, BUSTED-PH, Contrast-FEL, aBSREL, MEME, RELAX. To skip a model, comment out in rule all in the Snakefile. 

### Step 5: 
Run Snakemake:

`bash RUN_SNAKEFILE.sh`
