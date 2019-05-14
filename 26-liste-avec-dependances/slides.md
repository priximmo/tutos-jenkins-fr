%title: Jenkins
%author: xavki

-> Jenkins Pipeline : lites dépendantes <-
========

<br>
* consul : détail dans la playlist

<br>
* job alimenté par des éléments dynamiques (on y touche jamais)

		1- Sélectionner un service (connu dans consul)
		2- on préselectionne les machines par le services (consul)


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

