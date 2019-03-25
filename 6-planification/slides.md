%title: Jenkins
%author: xavki

-> Jenkins : Planification <-
========


* scheduler : dans "ce qui déclenche le build"


<br>
* même typo que les crons linux

```
MINUTE   HOUR   DOM   MONTH   DOW


MINUTE	Minutes within the hour (0–59)
HOUR	The hour of the day (0–23)
DOM	The day of the month (1–31)
MONTH	The month (1–12)
DOW	The day of the week (0–7) where 0 and 7 are Sunday.


``` 

------------------------------------------------------------



-> Exemples <-



* toutes les minutes

```
* * * * *
```


* toutes les 15 minutes

```
H/15 * * * *
```


* tous les lundis à 13h00

```
00 13 * * 1
```
