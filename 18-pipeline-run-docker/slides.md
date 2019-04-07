%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Docker <-
========



<br>
* pourquoi ?

 
* runner des conteneurs et travailler dedans (environnement personnalisé - ex: ubuntu:1804)

* runner des conteneurs pour faire des test dessus
 
* construire des images pour livrer et déployer en production

 
* intégrer des tests sur conteneurs


* attention : sudo usermod -aG docker $USER


* si on simplifie, deux cas :
			* agent : on travaille dans le conteneur (le conteneur est un host)
			* node : on travaille de l'extérieur du conteneur (le conteneur est une cible)

<br>

* doc : https://jenkins.io/doc/book/pipeline/docker/

-----------------------------------------------------


->  Run d'un nginx <-


* cas du node : on est à l'extérieur

```
node {
        docker.image('nginx:latest').withRun('-p 80:80') { c ->

        sh 'docker ps'

        sh 'curl localhost'

    }
}
```


* cas de l'agent : on est dedans

```
pipeline {
    agent {
        docker {
            image 'nginx:latest'
            args '-p 80:80'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'cat /etc/nginx/conf.d/default.conf'
            }
        }
    }
}
```

