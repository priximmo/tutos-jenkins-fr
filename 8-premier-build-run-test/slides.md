%title: Jenkins
%author: xavki

-> Jenkins : Premier build/run/test <-
========


<br>
* retenir le principe pas le fond



* exemple : "Hello World"



* 3 jobs :
		- 1-build
		- 1-run
		- 1-test

--------------------------------------------------------



-> BUILD <-




* java (normalement avec git) et on compile


```
mkdir -p /tmp/xavki/
rm -rf /tmp/xavki/*
echo '
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
'  >/tmp/xavki/Main.java
javac /tmp/xavki/Main.java
```


-------------------------------------------------------


-> RUN <-



* lancement du java avec écriture dans un fichier du résultat

* attention dépendance avec le build



```
cd /tmp/xavki/
java Main >test.file
```

-------------------------------------------------------



-> TEST <-


* dépendant du déclenchement du RUN

* un principe

* on affiche le contenu du fichier test.file (on pourrait faire des tests dessus)


```
cd /tmp/xavki/
echo "###### contenu du test.file ######"
cat test.file
```

