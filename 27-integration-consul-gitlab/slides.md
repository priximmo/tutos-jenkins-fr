%title: Jenkins
%author: xavki

-> Jenkins Pipeline : exemple consul et gitlab <-
========

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
		3- on liste les tags de l'image (gitlab)


------------------------------------------------------------------------------------------



