# In Exosphere (jetstream2.exosphere.app)
Go to https://jetstream2.exosphere.app/
Click Create -> Instance
Choose Rocky Linux 8 (same as used at MSI)
Name the instance something like GEMSX001
Choose m3.small (ensure enough RAM for Jupyter)
Select advanced
Select Assign a pulic IP address to this instance

# In OpenStack (js2.jetstream-cloud.org)
Go to https://js2.jetstream-cloud.org/project/instances/
On the drop down next to the new instance, choose "Edit Security Groups"
Add GEMSX001 to the instance's security groups

# Back in Exosphere
Open the list of instances
Note the attached IP address, referred to as INSTANCE-IP-ADDR below
Click the specific instance
Click the "Web Shell" Interactions

# Instance webshell
docker -ti -p8888:8888 rockylinux:8 /bin/bash
dnf update
dnf install python3.12 python3.12-pip zip which nano procps-ng
useradd -m jupyter
su - jupyter
pip3 install jupyterlab
jupyter server password # Set to GEMSX001
jupyter lab --ip 0.0.0.0

# Connect to Jupyter at INSTANCE-IP-ADDR:8888
Upload the zip files for the class products
unzip the files and delete the zips
