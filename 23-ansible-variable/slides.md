%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Ansible Variables <-
========


<br>
* passer des variables de jenkins à ansible


* pour :
		* fixer les hosts
		* écraser des variables dans des templates
		* configurer des ip
		...

* exemple : liste déroulante de hosts et variable de Home


---------------------------------------------------------------------


-> Comment passer une variable ? <-


* Comme d'habitude lol

<br>
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
          inventory: 'hosts.yml',
          extras: '--extra-vars "mavariable=${MAVARIABLE}"'
      )
    }
}
```

Rq : variabiliser le hosts.yml
