%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Jenkinsfile <-
========



<br>
* Jenkinsfile : versionner


* déclaratif


* facile à utiliser sur d'autres serveurs





--------------------------------------------------------------------------------------------


-> Toujours : clone / build / run <-


<br>

* groovy :

```
pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                checkout([$class: 'GitSCM',
                branches: [[name: '*/master']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [],
                submoduleCfg: [],
                userRemoteConfigs: [[url: 'https://github.com/priximmo/jenkins-helloworld.git']]])
                sh "ls"
            }
        }
        stage('Build') {
            steps {
                sh "javac Main.java"
            }
        }
        stage('Run') {
            steps {
                sh "java Main"
            }
        }
    }
}
```
