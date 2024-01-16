# SNAKEFILE TO USE FOR BASIC HYPHY ANALYSES

### Set config and specify if gene trees will be used ('included_gene'), or if one master species will be used('included_species'), or if raxml will be used to make new gene trees ('raxml'). 
Please use unlabled tree files with corresponding trait files

The specified snakefile will run the following models: BUSTED-E, BUSTED-PH, Contrast-FEL, aBSREL, MEME, RELAX. To skip a model, comment out in rule all. 
