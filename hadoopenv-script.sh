adminuser_name=$1
sudo apt-get install -y update
sudo apt install -y unzip
##==========================================================================
# Passwordless ssh login 
rm -f /home/$adminuser_name/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f /home/$adminuser_name/.ssh/id_rsa
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/authorized_keys
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/known_hosts
sudo chown -R $adminuser_name:$adminuser_name /home/$adminuser_name/.ssh
ssh -o StrictHostKeyChecking=no $adminuser_name@localhost 'sleep 5 && exit'
ssh -o StrictHostKeyChecking=no $adminuser_name@0.0.0.0 'sleep 5 && exit'

# ====================================================================
sudo su $adminuser_name
cd ~

rm -f ~/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/known_hosts
chmod 0600 ~/.ssh/authorized_keys

ssh -o StrictHostKeyChecking=no $USER_NAME@localhost 'sleep 5 && exit'
ssh -o StrictHostKeyChecking=no $USER_NAME@0.0.0.0 'sleep 5 && exit'
echo "Sample Outpout ">>t5.dat
##==========================================================================
# Creating Installation directory 
sudo mkdir -p /app/bigdata
sudo chown -R $adminuser_name:$adminuser_name /app

#wget https://github.com/rajuchal/cloud_env_template/archive/master.zip
#unzip master.zip
#cd cloud_env_template-master/
#sh install.sh $adminuser_name
