# Simulate 600 SFS based on the best model parameters
fsc2702 -i AFS_RAD_alt4_allids_maxL.par -n600 -j -m -s0 -u -x -q

# Notes on AFS_RAD_alt4_allids_maxL.par
# we simulated 62000 DNA segments because this is the number of cut sites obtained by digesting the Antarctic fur seal genome with SbfI
# the simulated DNA sequences are 500 bp long because each restriction site generate two adjacent RAD loci that have been PE sequenced.
