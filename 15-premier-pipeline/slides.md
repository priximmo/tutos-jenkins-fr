%title: Jenkins
%author: xavki

-> Jenkins : premier pipeline <-
========


<br>
* pipeline: chaine d'actions / jobs décrits par du code (groovy)


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

* Jenkinsfile : intégre directement ce script dans le dépôt


--------------------------------------------------------------------------------------------


-> Exemple : clone / build / run <-



<br>
* java helloworld


* groovy :

```
pipeline {
    agent any 
    stages {
        stage('clone') { 
            steps {
                sh "rm -rf *"
                sh "git clone https://github.com/priximmo/jenkins-helloworld"
            }
        }
        stage('build') { 
            steps {
                sh "cd jenkins-helloworld/ && javac Main.java"
            }
        }
        stage('run') { 
            steps {
                sh "cd jenkins-helloworld/ && java Main"
            }
        }
    }
}
```
