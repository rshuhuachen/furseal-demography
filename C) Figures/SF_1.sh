# First let's get all of the simluated SFS (see "Simulate_SFS.sh") in a single file.

for i in {1..600}
do
tail -1 AFS_RAD_alt4_allids_maxL_$i/AFS_RAD_alt4_allids_maxL_MSFS.obs >> All_SFS.txt
done

# Also get only the SFS entry from the empirical SFS:
tail -1 AFS_RAD_alt4_allids_MAFpop0.obs > Emp.sfs

# Open R to get mean and sd values for each SFS class based on the 600 simulated files.
### R ###
data<-read.table("All_SFS.txt",h=F)
avs<-apply(data,2,function(x) mean(x))
sds<-apply(data,2,function(x) sd(x))
write.table(cbind(avs,sds),"Simulated_avs_and_sds.txt",quote=F,row.names=F,col.names=F,sep="\t")

# These can then be easily plotted against the empirical SFS
emp<-read.table("Emp.sfs",h=f)
data<-read.table("Sim_aver.txt",h=F)
barplot(data[-c(1,2),1])
barplot(emp[-c(1,2),1])
