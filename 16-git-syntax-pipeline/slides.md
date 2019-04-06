%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Git syntax<-
========


<br>
* modèle : https://jenkins.io/doc/book/pipeline/

```
pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                // 
            }
        }
        stage('Test') { 
            steps {
                // 
            }
        }
        stage('Deploy') { 
            steps {
                // 
            }
        }
    }
}
```



--------------------------------------------------------------------------------------------


-> Toujours : clone / build / run <-


<br>
* java helloworld

```
https://github.com/priximmo/jenkins-helloworld/
```


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
