export DEBIAN_FRONTEND=noninteractive
adminuser_name=$1
sudo apt-get install -y update 2>/dev/null
sudo apt-get install -y unzip
##==========================================================================
#--------------------------------------------------
# Passwordless ssh login for azureuser
sudo su - $adminuser_name
cd
pwd
echo $USER
echo $HOME
echo `pwd`>>t2.dat

cd /home/$adminuser_name

sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name/.ssh
rm -f /home/$adminuser_name/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f /home/$adminuser_name/.ssh/id_rsa
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/authorized_keys
#cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/known_hosts
sudo chmod 0600 /home/$adminuser_name/.ssh/authorized_keys
sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name

## ----------------------------------------------
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@localhost /bin/bash
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@0.0.0.0 /bin/bash
echo `pwd`>>t3.dat

##==========================================================================
# Creating Installation directory 
sudo mkdir -p /app/bigdata
sudo chown -R $adminuser_name:$adminuser_name /app

#wget https://github.com/rajuchal/cloud_env_template/archive/master.zip
#unzip master.zip
#cd cloud_env_template-master/
#sh install.sh $adminuser_name


#ssh -o StrictHostKeyChecking=no -T $adminuser_name@localhost 'sleep 2 && exit'
#ssh -o StrictHostKeyChecking=no -T $adminuser_name@0.0.0.0 'sleep 2 && exit'
