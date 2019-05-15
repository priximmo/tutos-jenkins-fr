%title: Jenkins
%author: xavki

-> Jenkins Pipeline : déploiement consul/gitlab/ansible <-
========

<br>
* vidéo 24 : comment faire un début d'intégration continue

* reste à déployer de manière orchestrée

Rq : ajouter des test (série de vidéos sur jmeter + ajouter JUnit)

<br>
* consul : détail dans la playlist

<br>
* job alimenté par des éléments dynamiques (on y touche jamais)

* installation simplifiée pour exemple :
	- consul master = machine jenkins
	- consul installé par script (orechestration normalement)
	- but : déployer notre war sur une machine avec 2 listes :
		1- on veut déployer un service (connu dans consul)
		2- on préselectionne les machine spar le services (consul)
		3- on liste les image/tags de l'image (gitlab)


------------------------------------------------------------------------------------------

-> Consul : récupération du nom de service <-




* Nom du service


```
import groovy.json.JsonSlurper;
def jsonSlurper = new JsonSlurper()
def nfile = "curl http://192.168.99.100:8500/v1/catalog/services".execute().text
def result = jsonSlurper.parseText(nfile)
def affichage = result.keySet().collect { it as String }
affichage.add(0,'Veuillez saisir un service...')
return affichage
```


-------------------------------------------------------------------------------------------


-> Consul : liste des serveurs du service <-



* Liste des serveurs


```
import groovy.json.JsonSlurper;
def jsonSlurper = new JsonSlurper()
def nfile = "curl http://192.168.99.100:8500/v1/catalog/service/$Service".execute().text
def result = jsonSlurper.parseText(nfile);
return result.Node
```



-------------------------------------------------------------------------------------------


-> Liste des tags docker pour une image <-


* nom image = nom du service (présélection)

* Choix de l'image docker : image/tag


```
import groovy.json.JsonSlurper;
def jsonSlurper = new JsonSlurper()
def nfile = "curl -s https://gitlab.com/api/v4/projects/9724367/registry/repositories".execute().text
def service = "$Service"
def list = jsonSlurper.parseText(nfile);
for(def element : list) {
    if (element.name == "$service"){
        id_filter =  element.id
    }
}
def jsonSlurper2 = new JsonSlurper()
def tags = "curl -s https://gitlab.com/api/v4/projects/9724367/registry/repositories/${id_filter}/tags".execute().text
def list_tags = jsonSlurper2.parseText(tags);
return list_tags.path
```

-------------------------------------------------------------------------------------------


-> Run par Ansible <-


```
node{
    stage('Deploy - Clone') {
          git 'https://github.com/priximmo/jenkins-ansible-docker.git'
    }
    stage('Deploy - Run') {
      ansiblePlaybook (
          colorized: true,
          become: true,
          playbook: 'playbook.yml',
          inventory: '${Serveur},',
          extras: "--extra-vars 'image=registry.gitlab.com/${ImageDocker}'"
      )
    }
}
```

