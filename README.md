## Azure Resource Manager(ARM) Template and Automation Script
## to setup Single Node Cluster environment in Microsoft Azure
####  Single Node _Hadoop/Spark/HBase/Kafka/Cassandra/MongoDB_ Cluster with Windows VM Gateway
#### This environment should be used by Single User only 

Template & Automation Script for creating single node _hadoop/spark/kafka/cassanda/mongodb_ cluster in Azure

### Note :- To run this script you should have proper Rights & Permissions to create resources in Azure 

## Connection architecture

**Client Desktop/Laptop --> RDP Connection --> Azure Windows VM --> SSH Connection --> Azure Linux VM**

## Functions of the template & script -
1. Create single instance Windows VM for Client log-in using RDP connection
2. Download SSH clients into Windows VM
3. Create single instance Linux VM for Client log-in using SSH connection from Windows VM
4. Install Hadoop stack, Spark, Kafka, Cassandra, MongoDB into Linux VM

## Installation Guide

1. Open Azure Portal   [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/)

2. Open Power Shell in Aazure Portal
3. Download the Power shell script 

    #### wget https://raw.githubusercontent.com/rajuchal/cloud_env_template/master/template-script/create-single-env.ps1

4. Download the ARM template & Parameter file

    #### wget  https://raw.githubusercontent.com/rajuchal/cloud_env_template/master/template-script/singleuser-env-template.json
    
    #### wget https://raw.githubusercontent.com/rajuchal/cloud_env_template/master/template-script/singleuser.parameters.json
    #### dir

    ##### Check the template file "single-env-template.json" location
    ##### Check the parameter file "singleuser.parameters.json" location

5. Run the Power shell script

    ##### PS/home/USER_NAME>./create-single-env.ps1
    
        **EXAMPLE**
        Enter the same project name: lkm_dna_env
        Enter the full path of template file location: ./singleuser-env-template.json
        Enter the full path of parameter file location: ./singleuser.parameters.json
        

6. After script execution completed, Connect Windows VM using RDP
7. Check the location "C:\windowsTools" for Windows Tools (SSH Clients & Browser)
   - Unzip MobaXTerm or SmarTTY
   - Connect with Linux VM using SSH connection
   - IP Address for Linux VM - 10.1.2.4
   - Use same User Name & Password of Windows for Linux VM Log-in 

8. Start Hadoop Services in Linux VM
    ##### $ start-dfs.sh
    ##### $ start-yarn.sh

9. Create Hadoop Home Directory
   ##### $ hdfs dfs -mkdir -p /user/azureuser
   ##### $ hdfs dfs -ls
   
10. Start Spark Services in Linux VM
    ##### $ start-master.sh
    ##### $ start-slaves.sh

11. Start Spark(Scala/Java) Shell  in Linux VM

    ##### $ spark-shell --master spark://localhost:7077

12. Start Spark(Python) Shell  in Linux VM

    ##### $ pyspark --master spark://localhost:7077

13. Start Hive  in Linux VM

    ##### $ hive

### Note-
#### Installation directory in Linux VM - /app/bigdata
#### Default user name for Windows & Linux VM - azureuser
#### Default password for Windows & Linux VM - Password@1234

##### _Before Starting MongoDB Service, install the library shown below_
#### $ sudo apt-get -y install libcurl3



:+1: **_Happy Clustering in Azure_** :shipit:


