adminuser_name=$1
sudo apt-get install -y update
sudo apt install -y unzip
rm -f ~/.ssh/id_rsa
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
echo $adminuser_name >>t.dat
sudo mkdir -p /app/bigdata
sudo chown -R $adminuser_name:$adminuser_name /app
