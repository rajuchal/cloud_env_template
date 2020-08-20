adminuser_name=$1
sudo apt-get install -y update
sudo apt install -y unzip
ssh-keygen -q -t rsa -P "" -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/known_hosts
cat $adminuser_name >>t.dat
