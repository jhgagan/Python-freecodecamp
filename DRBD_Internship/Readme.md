# Distributed Replicated Block Device (DRBD)

DRBD is a distributed replicated storage system of linux servers. This is designed to have very high availablity. This is achieved by mirroring a whole block device using network connectivity.

In short we can say that DRBD implements network based RAID 1 coniguration for the data block devices. It can be used to mirror the file systems across the nodes, VM imagesa dna other block devices across the network.

Overview of DRBD in the context of two independent servers that provide independent storage resources. One of the servers is commonly defined as the primary and the other one is secondary server. The DRBD software provides sychronization between the primary and secondary servers for user-based Read and Write operations as well as other synchronization operatoins.

We need to also note that DRBD helps obtai high availability for the data, not for the service. For hgh availablity of the service we need to use some cluster managers like Pacemaker.

DRBD Operations:

The most commonly used Data synchronization mode is Active-Passive. In this Active/Passive mode, the primary node is udef for Read and Write operations for all users. The secondary node is promoted to primary if the clustering solution detects that the primary node is down. Write operations starts at primary node for Write operations called fully synchronous and asynchronous. 

DRBD can also support the active/active mode, which means Read and Write operations can occur at both servers simultaneously. This mode relies on a shared-disk file system, such as the lobal File System (GFS) or the Orcale CLuster File Systems version 2 (OCFS2), which includes distributed lock-management capabilities.



Source for the information: 
1. DRBD Linux Cluster for Data High Availability: Link - https://www.youtube.com/watch?v=AZ3LuxS9uL8
