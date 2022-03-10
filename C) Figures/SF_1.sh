# First let's get all of the simluated SFS (see ) in a single file

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
