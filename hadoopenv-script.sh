export DEBIAN_FRONTEND=noninteractive
adminuser_name=$1
sudo apt-get install -y update 2>/dev/null
sudo apt-get install -y unzip
##==========================================================================

# Passwordless ssh login for root
echo "# Passwordless ssh login for root-----------"
pwd
cd /root
echo `pwd`>>t4.dat

rm -f /root/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 0600 /home/$adminuser_name/.ssh/authorized_keys
## ----------------------------------------------
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no root@localhost /bin/bash
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no root@0.0.0.0 /bin/bash
echo `pwd`>>t5.dat
#--------------------------------------------------
# Passwordless ssh login for azureuser
#sudo su - $adminuser_name

#pwd
#cd /home/$adminuser_name

#sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name/.ssh
#rm -f /home/$adminuser_name/.ssh/id_rsa
#ssh-keygen -q -t rsa -N '' -f /home/$adminuser_name/.ssh/id_rsa
#cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/authorized_keys
#cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/known_hosts
#chmod 0600 /home/$adminuser_name/.ssh/authorized_keys
#sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name

## ----------------------------------------------
#echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@localhost /bin/bash
#echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@0.0.0.0 /bin/bash
#echo `pwd`>>t3.dat

##==========================================================================

#	Third create a spark user with proper privileges and ssh keys.

	sudo addgroup spark
	sudo useradd -m -g spark spark
	sudo adduser spark sudo
	sudo chown spark:spark /home/spark

#	Add to sudoers file:

	echo "spark ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
	
	sudo su spark
	cd /home/spark
	rm -f /home/spark/.ssh/id_rsa
	ssh-keygen -q -t rsa -N '' -f /home/spark/.ssh/id_rsa && cat /home/spark/.ssh/id_rsa.pub >> /home/spark/.ssh/authorized_keys
  
  echo "Creating Password less login for spark user "
	ssh -o StrictHostKeyChecking=no -T spark@localhost 'sleep 2 && exit'
	ssh -o StrictHostKeyChecking=no -T spark@0.0.0.0 'sleep 2 && exit'
  
# Creating Installation directory 
sudo mkdir -p /app/bigdata
sudo chown -R spark:spark /app

#wget https://github.com/rajuchal/cloud_env_template/archive/master.zip
#unzip master.zip
#cd cloud_env_template-master/
#sh install.sh $adminuser_name


#ssh -o StrictHostKeyChecking=no -T $adminuser_name@localhost 'sleep 2 && exit'
#ssh -o StrictHostKeyChecking=no -T $adminuser_name@0.0.0.0 'sleep 2 && exit'
