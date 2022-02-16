## Description
An ansible project to deploy apache superset on Ubuntu box

## Technologies
Project is created and tested with:
* Ubuntu: 20.04
* Ansible: 3.8
* Python: 3.8
* apache-superset: 1.4.1
* postgres: 12.9

## Setup
1- Make sure to define following variables


usr: The username of the target host (it must be a non-root user with sudo privileges)  
	pass: The password of the above user  
	admin: Admin username of the superset service  
	adminpass: Password of the superset admin  
	dbpass: The password which will be set to access the database  


2- In the hosts.yml file set the vaulues of ansible_host (IP of the server) and server_name(the domain which the superset service is published on) to the desired values

3- Run the playbook with the following command (It is assumed that variables are stored in credential.yml vault file)

ansible-playbook -i hosts.yml --ask-vault-pass --extra-vars '@credentials.yml' playbook.yml

## Access
After configuration apache superset service should be available on http(s)://server_name 
