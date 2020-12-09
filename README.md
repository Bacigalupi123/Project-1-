## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram](https://drive.google.com/file/d/1l4xrGlrcNaHFDMMGevmSm9r3X-TVZRl6/view?usp=sharing)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

 [.Yaml](https://github.com/Bacigalupi123/Project-1-/tree/main/Ansible)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.
- Load balancers ensure that the virtual network is protected against possible DDOS attacks by traffic between the servers.
- The advantage of having the Jump-Box is that the box is hidden from the general public and can only be used by the system administrator.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system traffic.
- What does Filebeat watch for? Filebeat watches the specified location for any changes made to the files.
- What does Metricbeat record? Metric beat gathers the logs and the system metrics on your network and sends them to a designated output location

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Server   | 10.0.0.5   | Linux            |
| Web-2    | Server   | 10.0.0.6   | Linux            |
| Web-3    | Server   | 10.0.0.7   | Linux            |
| Elk      | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Admin Public IP address 

Machines within the network can only be accessed by another Virtual Machine on the network.
- Which machine did you allow to access your ELK VM? Jump Box, IP address is 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Admin Public IP      |
| Web-1    | No                  |     10.0.0.4         |
| Elk      | No                  |     10.0.0.4         |                  

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

The main advantage is that you can input a command into several different servers using the same playbook.

The playbook implements the following tasks:
- Docker was installed on all the machines on the network
- Python-pip was then installed
- The docker container for elk was started

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[Docker ps](https://github.com/Bacigalupi123/Project-1-/blob/main/Diagrams/DockerPS.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
  Web-2 10.0.0.6
  Web-3 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat, metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat will collect any changes that are made to the files, and metric beat will collect all the system metrics. With metric beats we would be able to detect changes in things like the CPU usage and the CPU/RAM statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the .yml file to the ansible directory.
- Update the hosts file to include the webservers and elkserver’s file.
- Run the playbook, and navigate to Kibana website to check that the installation worked as expected.
- The playbooks are metricbeat-playbook.yml and filebeat-playbook.yml and they are copied to /etc/ansible
- You will need to edit the hosts file to run on the specified machine to add the webserver and elkserver's IP address.
- Open a web browser and enter the following url "ElkserverpublicIP:5601/app/kibana".

Listed below are the specific commands the user will need to run to download the playbook, update the files, etc.

ansible-playbook filebeat-playbook.yml
ansible-playbook metricbeat-playbook.yml
