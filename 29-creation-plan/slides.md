%title: Jenkins
%author: xavki

-> Jenkins : création d'un plan Jmeter <-
========

Objectif : intégrer jmeter dans jenkins

* générer un plan au format jmx

* jouer ce plan dans jenkins à chaque déploiement

<br>
* Thread Group : tout ce qui est sauvegardé

<br>
* Workspace : zéro sauvegarde

<br>
* samplers : requêtes

* assertions: vérification du résultat / tests

* listeners : affichage du résultat

<br>
Exemple : parser la home et ses liens (wartest)

-----------------------------------------------------------------------------

-> Création du plan <-


<br>
0- Thread : 10 users - loop 1

<br>
1- création du sampler : HTTP Request ( ip - GET / - port 8081 )

<br>
2- HTTP request > add post processor : regular expression extractor
	- Body
	- name : urls
	- href='./([^']*)'
	- template : $1$
	- match : -1
	- default : NOLINK

<br>
3-  Thread > ajout insert parent > For each controller
	- input : urls
	- output : url
	- add _ before number

4- For Controller > add HTTP REQUEST
	- ip / port
	- GET
	- /${url}

<br>
4- Thread > View result tree
