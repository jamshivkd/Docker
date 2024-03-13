apt-get update -y
apt install -y default-jre software-properties-common git ftp
add-apt-repository ppa:deadsnakes/ppa

apt-get install -y python3.7 python3-pip 
update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
update-alternatives  --install     /usr/bin/python3 python3 /usr/bin/python3.7 1
apt-get install -y python3.7-distutils  apache2-utils rsync zip netcat
for i in $(cat /home/scripts/requirements.txt)
do 
 pip install $i
done
pip uninstall robotframework -y
pip install robotframework
ln -s /usr/bin/parallel-ssh /usr/bin/pssh
mkdir /home/jenkinsuser/.ssh
cp /home/scripts/config /home/jenkinsuser/.ssh/
cp /home/scripts/authorized_keys /home/jenkinsuser/.ssh/

 

