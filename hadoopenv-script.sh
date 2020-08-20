adminuser_name=$1
wget https://github.com/rajuchal/cloud_env_template/archive/master.zip
sudo apt-get install -y update
sudo apt install -y unzip
unzip master.zip
cd cloud_env_template-master/
sh install.sh $adminuser_name
