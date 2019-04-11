%title: Jenkins
%author: xavki

-> Jenkins Pipeline : générateur de syntax <-
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


-> Utilisateur de l'éditeur <-


<br>
* java helloworld

```
https://github.com/priximmo/jenkins-helloworld/
```


* groovy :

```
node {
    stage('clone') {
    git 'https://github.com/priximmo/jenkins-helloworld.git'
    sh label: '', script: '''ls
    javac Main.java
    java Main'''
}
}
```
