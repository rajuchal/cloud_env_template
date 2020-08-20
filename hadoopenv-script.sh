adminuser_name=$1
sudo apt-get install -y update
sudo apt install -y unzip
rm -f /home/$adminuser_name/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f /home/$adminuser_name/.ssh/id_rsa
cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/authorized_keys && cat /home/$adminuser_name/.ssh/id_rsa.pub >> /home/$adminuser_name/.ssh/known_hosts
sudo chown -R $adminuser_name:$adminuser_name /home/azureuser/.ssh
echo $adminuser_name >t.dat
sudo mkdir -p /app/bigdata
sudo chown -R $adminuser_name:$adminuser_name /app
