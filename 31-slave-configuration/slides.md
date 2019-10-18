%titles Jenkins
%author: xavki


# Jenkins : installation d'un slave


<br>
* répartition de la charge et plus de fluidité dans les déploiements

* disposer d'une plateforme de tests adaptés : os, docker, kubernetes...

<br>
* installation du slave :

```
apt-get update 
apt-get install default-jre
adduser jenkins
#vérif ssh  = ok dans /etc/ssh/sshd_config
```

<br>
* sur le master création d'une clef ssh

```
ssh-keygen
ssh-copy-id jenkins@192.168.61.3
```

* création du noeud

```
cat .ssh/id-rsa
```
