%title: Jenkins
%author: xavki

-> Jenkins : intégration jmeter <-
========

<br>
* bientôt playlist Jmeter dans le détail

<br>
* plugin jmeter "Performance"

Pb: fichier /etc/java-8-openjdk/accessibility.properties
Commenter : #assistive_technologies=org.GNOME.Accessibility.AtkWrapper

<br>
Principe :

<br>
* créer un plan de test jmeter via interface graphique

<br>
* exporter le plan (format jmx - xml)

<br>
* jouer le test en CLI dans le pipeline

<br>
* lecture des résultats via plugin "Performance"





----------------------------------------------------------------------------------------------



-> Installation de Jmeter <-


<br>
* download du binaire :

```
http://miroir.univ-lorraine.fr/apache//jmeter/binaries/apache-jmeter-5.1.1.zip
```

et unzip :

```
unzip apache-jmeter-5.1.1.zip -d /usr/bin/jmeter
```

attention: JAVA_HOME

```
/usr/lib/jvm/java-11-openjdk-amd64/
```
 
* install apt

```
apt-get install jmeter
```

