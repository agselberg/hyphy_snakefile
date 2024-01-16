########################################################
### SCRIPT TO REMOVE HYPHENS FROM SPECIES NAMES IN TREES
########################################################

import sys 
import re

input_tree = sys.argv[1]
cleaned_tree = sys.argv[2]

with open(input_tree, 'r') as i_t:
	tree_string = i_t.read()
tree_string = tree_string.rstrip()
tree_string = tree_string.replace("'", "")

pattern = re.compile(r'([a-zA-Z0-9_.-]+):')

# Define a replacement function
matches = pattern.findall(tree_string)

for match in matches:
	if match.startswith('Ald'):
		print(match)

matches_cleaned = [[match, match.replace('-', '_').replace('.', '_')] for match in matches]
#matches_no_hy = [[match, match.replace('-', '_')] for match in matches]
#print(matches_no_hy)
#exit()
#matches_cleaned = [[match, match.replace('.', '_')] for match in matches_no_hy]

#print('matches_cleaned: ', matches_cleaned)

for ind, match in enumerate(matches_cleaned):
	tree_string = tree_string.replace(match[0], match[1])

with open(cleaned_tree, 'w') as c_t:
	c_t.write(tree_string)

