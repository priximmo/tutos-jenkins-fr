%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Ansible <-
========


* sur la machine jenkins : 


		* installation ansible :

```
apt-get install ansible
```

		* ajout de clef ssh :


```
ssh-keygen
```

-------------------------------------------------------------------


-> Sur la machine distante <-
		


* ajout du user jenkins : 

```
useradd jenkins
```

* ajout de la clef ssh (à partir de jenkins)

```
ssh-copy-id -i <clef_pub> jenkins@<ip>
```

* nopasswd /etc/sudoers


* install docker sur la machine de prod (ansible...)
curl -fsSL https://get.docker.com | sh;

* add user jenkins to docker group
sudo usermod -aG docker $USER


-------------------------------------------------------------------


-> Ansible : sans plugin <-


```
node{

    stage('Clone') {
        git 'https://github.com/priximmo/ansible-jenkins.git'
    }
    stage('Ansible') {
   
    sh 'ansible-playbook -i hosts.yml playbook.yml'
    }

}
```

-------------------------------------------------------------------



-> Ansible : avec plugin <-



```
node{
    stage('Clone') {
        git 'https://github.com/priximmo/ansible-jenkins.git'
    }
    stage('Ansible') {
      ansiblePlaybook (
          colorized: true, 
          become: true,             
          playbook: 'playbook.yml',
          inventory: 'hosts.yml'
      )
    }
}
```


