# Simulate 600 SFS based on the best model parameters
fsc2702 -i AFS_RAD_alt4_allids_maxL.par -n600 -j -m -s0 -u -x -q

# Notes on AFS_RAD_alt4_allids_maxL.par
# we simulated 62000 DNA segments because this is the number of cut sites obtained by digesting the Antarctic fur seal genome with SbfI
# the simulated DNA sequences are 500 bp long because each restriction site generate two adjacent RAD loci that have been PE sequenced.

for i in {1..600}
do
tail -1 AFS_RAD_alt4_allids_maxL_$i/AFS_RAD_alt4_allids_maxL_MSFS.obs >> All_SFS.txt
done

# Open R to get mean and sd values for each SFS class based on the 600 simulated files.
### R ###
data<-read.table("All_SFS.txt",h=F)
avs<-apply(data,2,function(x) mean(x))
sds<-apply(data,2,function(x) sd(x))
write.table(cbind(avs,sds),"Simulated_avs_and_sds.txt",quote=F,row.names=F,col.names=F,sep="\t")

