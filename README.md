##  Azure Resource Manager(ARM) Template & Automation Script for 
####  Single Node Hadoop/Spark/HBase/Kafka/Cassandra/MongoDB Cluster with Windows VM Gateway

Template & Automation Script for creating single node hadoop/spark/kafka/cassanda/mongodb cluster in Azure

## Connection architecture

**Client Desktop/Laptop --> RDP Connection --> Azure Windows VM --> SSH Connection --> Azure Linux VM**

## Fucntions of the template & script -
1. Create single instance Windows VM for Client log-in using RDP connection
2. Download SSH clients into Windows VM
3. Create single instance Linux VM for Client log-in using SSH connection from Windows VM
4. Install Hadoop stack, Spark, Kafka, Cassandra, MongoDB into Linux VM

## Installation Guide

1. Open Azure Portal  
<html><body>
<a href="https://portal.azure.com/>
  <img src="https://aka.ms/deploytoazurebutton"/>
                                               </a></body></html>

2. Open Power Shell in Aazure Portal
3. Download the Power shell script 

    PS /home/USER_NAME/testscript> **wget https://raw.githubusercontent.com/rajuchal/cloud_env_template/master/create-single-env.ps1**

4. Download the ARM template file

    PS /home/USER_NAME/testscript> **wget  https://raw.githubusercontent.com/rajuchal/cloud_env_template/master/single-env-template.json**
    PS /home/USER_NAME/testscript> **dir**

**_Example_**
Directory: /home/USER_NAME/testscript

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-----           8/24/2020 11:56 AM          82309 create-single-env.ps1
-----           8/24/2020 11:57 AM         312983 single-env-template.json


Template Location - /home/USER_NAME/testscript/single-env-template.json

5. Run the Power shell script

####PS /home/<USER NAME>/testscript>./create-single-env.ps1####

Enter the same project name: lkm_dna_env
Enter the administrator User name: azureuser
Enter the administrator password: *************
Enter the full path of template file location: /home/<USER NAME>/testscript/single-env-template.json

6. After script execution completed, Connect Windows VM using RDP
7. Check the location "C:\windowsTools" for Windows Tools (SSH Clients & Browser)
   -Unzip MobaXTerm or SmarTTY
   -Connect with Linux VM using SSH connection
   -IP Address for Linux VM - 10.1.2.4
   -Use same User Name & Password of Windows for Linux VM Log-in 

8. Start Hadoop Services in Linux VM
$ start-dfs.sh
$ start-yarn.sh

9. Start Spark Services in Linux VM

$ start-master.sh
$ start-slaves.sh

10. Start Spark(Scala/Java) Shell  in Linux VM

$ spark-shell --master spark://localhost:7077

11. Start Spark(Python) Shell  in Linux VM

$ pyspark --master spark://localhost:7077

12. Start Hive  in Linux VM

$ hive


**_Happy Clustering in Azure_**


