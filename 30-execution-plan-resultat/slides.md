%title: Jenkins
%author: xavki

-> Jenkins - Jmeter : exécution du plan et résutlats <-
========

<br>
```
node{
    stage('Deploy - Clone') {
          git 'https://github.com/priximmo/jenkins-ansible-docker.git'
    }
    stage('Deploy - End') {
      ansiblePlaybook (
          colorized: true,
          become: true,
          playbook: 'playbook.yml',
          inventory: '${Serveur},',
          extras: "--extra-vars 'image=registry.gitlab.com/$ImageDocker'"
      )
    }
    stage('Test'){
        sh '/usr/bin/jmeter/apache-jmeter-5.1.1/bin/jmeter -n -t tests.jmx -l results.jtl'
        sh 'cat results.jtl'
        perfReport 'results.jtl'
    }
}
```
