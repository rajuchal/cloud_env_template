adminuser_name=$1
sudo apt-get install -y update
sudo apt install -y unzip
##==========================================================================
# Passwordless ssh login 
sudo su - $adminuser_name
cd /home/$adminuser_name
rm -f /home/$adminuser_name/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f /home/$adminuser_name/.ssh/id_rsa
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/authorized_keys
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/known_hosts
sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name/.ssh
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@localhost
echo 'sleep 2 && exit'|ssh -o StrictHostKeyChecking=no $adminuser_name@0.0.0.0
echo `pwd`>>t5.dat
# ====================================================================
#	Third create a spark user with proper privileges and ssh keys.

	sudo addgroup spark
	sudo useradd -m -g spark spark
	sudo adduser spark sudo
	sudo mkdir /home/spark
	sudo chown spark:spark /home/spark

#	Add to sudoers file:

	echo "spark ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
	
	sudo su - spark
	rm -f ~/.ssh/id_rsa
	ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

	ssh localhost
  echo `pwd`>>t4.dat
##==========================================================================
# Creating Installation directory 
sudo mkdir -p /app/bigdata
sudo chown -R spark:spark /app

#wget https://github.com/rajuchal/cloud_env_template/archive/master.zip
#unzip master.zip
#cd cloud_env_template-master/
#sh install.sh $adminuser_name
