# SNAKEFILE TO USE FOR BASIC HYPHY ANALYSES

### Step 1: set the enviornment 
Use the following commands before beginning:

`conda env create -f environment.yml`

`conda activate HYPHY_SNAKEMAKE`

### Step 2: Set config 
- Specify if gene trees will be used ('included_gene'), or if one master species will be used('included_species'), or if raxml will be used to make new gene trees ('raxml'). 
- Please use unlabled tree files with corresponding trait files.
- Set full paths for hyphy files and data directories, set extensions for data files.

### Step 3: Choose HyPhy models to run
The specified snakefile will run the following models: BUSTED-E, BUSTED-PH, Contrast-FEL, aBSREL, MEME, RELAX. To skip a model, comment out in rule all in the Snakefile. 

### Step 4: 
Run Snakemake:

`bash RUN_SNAKEFILE.sh`
