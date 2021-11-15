---
title: "SEISMIK Documentation"
author: [Daniel Schwarz]
date: "07.11.2021"
subject: "Markdown"
keywords: [Documentation, SEISMIK]
subtitle: "Dokumentation"
lang: "de"
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage: true,
titlepage-background: "backgrounds/bgtitleblue2.pdf"
header-center: "\\leftmark"
header-right: "\\thetitle"
footer-left: "\\thedate"
footer-center: "\\theauthor"
footer-right: "Seite \\thepage"
listings-no-page-break: true
page-background: "backgrounds/bgpages.pdf"
toc-own-page: true
footnotes-pretty: true
header-left: '\headerlogo'
header-includes: |
  \usepackage{sectsty, xcolor}
  \sectionfont{\clearpage}
  \hypersetup{
    colorlinks=false,
    pdfborderstyle={/S/U/W 1},  % underline links instead of boxes
    linkbordercolor=white,      % color of internal links
    citebordercolor=green,      % color of links to bibliography
    filebordercolor=magenta,    % color of file links
    urlbordercolor=lightgray       % color of external links
  }
  ```{=latex}
  \newcommand{\headerlogo}{\includegraphics[width=0.5cm]{backgrounds/logo.pdf}}
  ```
...

# SEISMIK

## Vorwort

Diese Dokumentation wurde für mein Projekt bei [Cimdata](https://www.cimdata.de/)
mit [OracleSQL](https://www.oracle.com/ch-de/database/technologies/) erstellt.

Aufgabe ist es, eine Datenbank anzulegen und mit Hilfe von SQL-Scripten via
dem cl-tool sqlplus/sqlcl ein kleines "Programm" zu erstellen. Zusätzlich ist
eine Dokumentation sowie Präsentation gewünscht.

Die SQL-Scripte sollen:

- eine Datenbank anlegen
- die erforderlichen Tabellen erstellen
- Dummy Daten in die Tabellen einfügen
- eine Menüstruktur zur wiederholten Ausführung anbieten
- man soll folgendes im Menü auswählen können
  - Datenbank aufsetzten
  - Datensätze löschen
  - Datensätze anlegen
  - Datenabfragen realisieren
  - Datenbank löschen

Ich habe hierbei mit Gnu/Linux - Fedora Silverblue[^e] - gearbeitet. Um den Oracle
SQL Server aufzusetzen benutze ich [Podman](https://podman.io/) - ein Containertool, verwendet um
den Server in einem Container aufzusetzen.

Zur Dokumentation habe ich Markdown benutzt und dieses mit
dem Tool [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) in eine PDF-Datei gerendert.

```{.bash caption="Eisvogel cl-Befehl"}
pandoc documentation.md -o documentation.pdf --from markdown --template eisvogel -V lang=de --shift-heading-level-by=-1 --toc --number-sections --listings
```
[^e]: Immutable OS

## Aufgabenstellung

Entwickeln Sie eine Datenbank zu einem von ihnen gewählten Thema mit den Schwerpunkten:
Konzeptueller und physischer Entwurf der Datenbank.

### Anforderungen
Innerhalb der Projektwoche (Montag bis Donnerstag) soll eine Aufgabe oder abgegrenzte
Teilaufgabe bearbeitet werden.
Hierfür müssen folgende Projekt-Schwerpunkte umgesetzt werden:

- Konzeptueller Entwurf der Datenbank, deren Ergebnis in der Dokumentation
festgehalten wird,
- Physischer Entwurf der Datenbank, deren Ergebnis durch Skripte realisiert wird und
- Präsentation des Projektes

Die Bearbeitung des Projektes kann als Einzel- oder Gruppenarbeit, bestehend aus 2
Teilnehmern erfolgen. Der Dozent ist prinzipiell der Gruppenleiter, dessen Eingreifen in die
Geschicke der Gruppe nur in Ausnahmefällen passiert, um beispielsweise das Projekt
voranzubringen.

Mit Beginn des Projektes muss sich jeder Studierende entschieden haben, ob das Projekt als
Einzel- oder Gruppenarbeit durchgeführt wird. Ein nachträgliches Ändern des Teams ist
während der Projektphase nicht möglich.

## Grobstruktur

### Übersicht

Der Kunde wünscht, eine europäische Konkurrenz-Entität für [Instagram](https://www.instagram.com/) 
zu etablieren. 
Hierfür soll verstärkt auf Anonymität, No-Tracking und Datenschutz für zukünftige Benutzer
gesetzt werden. Zudem soll es Werbefrei gestaltet werden. User können Geld
verdienen in dem Sie bestimmte Kriterien erfüllen.

Das Produkt soll in einer ersten Version als Prototyp dienen, um notwendige
Schnittstellen, zu bereits vorhanden Backendsystemen des Kunden auszubauen und anpassen zu können.
Später wird das Projekt dann im Umfang ausgebaut und auf verschiedenen
Frontendapps verteilt. Angedacht sind Mobile-apps, eine Web-app als SaaS
sowie eine Desktop-app für die gängigen Betriebssysteme.

### Produktname

Für das Projekt habe ich den Namen "**SEISMIK**" gewählt. In der Überzeugung das wir
mit diesem Produkt den Markt der Social-Media-Apps "erschüttern" werden.

### Logo

Das Logo und die Corporate Identity habe ich in Abstimmung mit dem Auftraggeber 
von einem Grafik-Designer entwickeln lassen und lizenziert.

### Funktionen

Benutzer sollen sich Registrieren können und anschließend ein- bzw. ausloggen. Sie
können dann Posts erstellen in deren Inhalt es sich - in der ersten Ausbaustufe -
vor allem um Bilder handelt.
Die Benutzer sollen Posts von anderen Benutzern liken und kommentieren können.

## Feinstruktur

### Reference (Instagram)

[Instagram](https://www.instagram.com/) ist ein soziales Netzwerk, ähnlich
[Twitter](https://twitter.com) oder [Facebook](https://facebook.com/). Der Fokus 
liegt hier vor allem auf Video- und Foto-Sharing. 

Mit mehr als 20 Mio. Nutzern allein in Deutschland und 150 Mio. Weltweit zählt 
Instagram zu einem der größeren Vertreter der Social-Media-Apps.

---

Man kann es sich wie eine Art Online-Fotoalbum vorstellen, in dem man Einblicke
in sein Leben geben kann. Es ist auf allen gängigen Plattformen erhältlich und 
wird auch gern von Unternehmen zur Reichweitensteigerung genutzt.

![Instagram - Übersicht](img/insta_overview.png)

#### Users

![Instagram - Useraccount](img/insta_user.png) 

Benutzer laden Bilder hoch, die sie durch Tags (Hashtags) kategorisieren können.
Diese Bilder können in Ihrer Größe verändert werden und man kann verschiedene
Farbfilter auf sie Anwenden.

---

**Funktionsübersicht**

- Hochladen von Bildern aus dem Album oder direkte Verknüpfung mit der Kamera des Smartphones oder Tablets
- Hochladen oder Drehen von Videos
- Geotag-Funktion, über die eine eigene Fotokarte eines Nutzers angelegt werden kann
- Austausch über Fotos mit anderen Usern
- Like-Funktion in Form eines Herzes 
- Kommentar-Funktion, mit der Möglichkeit Hashtags zu verwenden

#### Posts

![Instagram - Post eines Fotos](img/insta_post.png) 

#### Tags (und Following)

![Instagram - Following und Hashtags](img/insta_following.png) 

### Relevante Objekte

Aus der Analyse von Instagram ergeben sich die nachfolgend beschriebenen relevanten
Objekte für unser Projekt SEISMIK.

#### Users

Das sind die Benutzeraccounts zur Identifizierung eines Benutzers.

- Benutzername ist unique und nicht leer (min. 4 Zeichen)
- Passwort ist nicht leer (min. 8 Zeichen)
- beim erstellen des Benutzers wird ein Timestamp erstellt

| **id**                  | Eindeutige ID zur internen Identifizierung der User    |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Ganze Zahlen    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System / Auto_Incement   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Nein   |
| Primärschlüssel         | Ja   |
| Sonst                   | automatisch vom System verwaltet über Constraint   |
| Beispielwerte           | 1, 2, 3, ...   |

| **username**            | Eindeutiger vom Benutzer gewählter Identifier          |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Text    |
| Werte-Einschränkung     | min. 4 Zeichen   |
| Wertevergabe            | Benutzereingabe   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Nein   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | 'Roland', '11KidShredder', 'user.dummy'   |

| **passwd**              | vom Benutzer gewähltes Passwort gehashed in SHA2       |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Text    |
| Werte-Einschränkung     | min. 8 Zeichen   |
| Wertevergabe            | Benutzereingabe   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Ja   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | '12345678', '12fdfs2e123', 'sdf-.?. .ddds'   |

| **created_at**          | vom System automatisch erstellter Timestamp            |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Datum & Zeit    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System, bei Erstellung des Accounts   |
| Default-Wert            | Ja, sysdate   |
| NULL-Wert-erlaubt       | Ja   |
| Duplikate erlaubt       | Ja   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | '11.11.2021 23:59:59' ...   |

#### Photos

Dies sind die Photos die von Usern gepostet werden

- Das Bild wird vorerst als url gespeichert
- beim erstellen des Fotos wird ein Timestamp erstellt

| **id**                  | Eindeutige ID zur internen Identifizierung der Bilder    |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Ganze Zahlen    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System / Auto_Incement   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Nein   |
| Primärschlüssel         | Ja   |
| Sonst                   | automatisch vom System verwaltet über Constraint   |
| Beispielwerte           | 1, 2, 3, ...   |

| **image_url**           | Verlinkt zum geposteten Bild eines Benutzers  |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Text    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | Benutzereingabe   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Ja   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | 'img/katze.jpg' ... |

| **created_at**          | vom System automatisch erstellter Timestamp            |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Datum & Zeit    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System, bei Erstellung des Accounts   |
| Default-Wert            | Ja, sysdate   |
| NULL-Wert-erlaubt       | Ja   |
| Duplikate erlaubt       | Ja   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | '11.11.2021 23:59:59' ...   |

#### Tags

Jedes Bild kann verschieden Tags zugeordnet werden.

- Tags sind Einzigartig
- beim erstellen des Fotos wird ein Timestamp erstellt

| **id**                  | Eindeutige ID zur internen Identifizierung der Bilder    |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Ganze Zahlen    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System / Auto_Incement   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Nein   |
| Primärschlüssel         | Ja   |
| Sonst                   | automatisch vom System verwaltet über Constraint   |
| Beispielwerte           | 1, 2, 3, ...   |

| **tag_name**            | Bezeichner für die verschiedenen Tags der Bilder  |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Text    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | Benutzereingabe   |
| Default-Wert            | Nein   |
| NULL-Wert-erlaubt       | Nein   |
| Duplikate erlaubt       | Nein   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | 'cat', 'drachenlordImKnast', 'WM2020' ... |

| **created_at**          | vom System automatisch erstellter Timestamp            |
|------------------------ | ------------------------------------------------------ |
| Wertebereich            | Datum & Zeit    |
| Werte-Einschränkung     | Nein   |
| Wertevergabe            | System, bei Erstellung des Accounts   |
| Default-Wert            | Ja, sysdate   |
| NULL-Wert-erlaubt       | Ja   |
| Duplikate erlaubt       | Ja   |
| Primärschlüssel         | Nein   |
| Sonst                   | -   |
| Beispielwerte           | '11.11.2021 23:59:59' ...   |

### Beziehungen

Aus der Analyse von Instagram ergeben sich die nachfolgend beschrien Beziehungen 
für unser Projekt SEISMIK.

#### posten

Ist eine Binäre Beziehung zwischen Users und Photos.

- Jeder User kann ein oder mehrere Fotos posten
- Jedes Foto wird von genau einem User gepostet

|         | **Beteiligung**                 | **Kardinalität**    |
|-------  | ---------------                 | ---------------     |
| Users   | `0`                               | `N`                   |
|         | Jeder User muss kein Foto posten  | Jeder User kann mehrere Fotos posten    |
| Photos  | `1`                               | `1`       |
|         | Jedes Foto muss von einem User | Jedes Foto wird von höchstens|
|         | gepostet werden                 | einem User gepostet |

#### liken

Ist eine Binäre Beziehung zwischen Users und Photos.

- Jeder User kann ein oder mehrere Fotos liken
- Jedes Photo kann von mehreren Usern geliked werden

|         | **Beteiligung**                 | **Kardinalität**    |
|-------  | ---------------                 | ---------------     |
| Users   | 0                               | N                   |
|         | Jeder User muss kein Foto liken  | Jeder User kann mehrere Fotos liken    |
| Photos  | 0                               | M       |
|         | Jedes Foto muss nicht von einem | Jedes Foto kann von mehreren|
|         | User geliked werden                 | User geliked werden |

#### comments

Ist eine Binäre Beziehung zwischen Users und Photos.

- Jeder User kann ein oder mehrere Fotos kommentieren
- Jedes Photo kann von mehreren Usern kommentiert werden

|         | **Beteiligung**                 | **Kardinalität**    |
|-------  | ---------------                 | ---------------     |
| Users   | 0                               | N                   |
|         | Jeder User muss kein Foto kommentieren  | Jeder User kann mehrere Fotos kommentieren    |
| Photos  | 0                               | M       |
|         | Jedes Foto muss nicht von einem | Jedes Foto kann von mehreren|
|         | User kommentiert werden                 | User kommentiert werden |

#### having

Ist eine Binäre Beziehung zwischen Tags und Photos.

- Jeder Tag muss einem oder mehreren Fotos zugeordnet sein
- Jedes Photo kann mit mehreren Tags gekennzeichnet werden 

|         | **Beteiligung**                 | **Kardinalität**    |
|-------  | ---------------                 | ---------------     |
| Tags   | 1                               | N                   |
|         | Jeder Tag muss einem Foto zugeordnet sein  | Jeder Tag kann mehreren Fotos zugeordnet sein    |
| Photos  | 0                               | M       |
|         | Jedes Foto muss nicht mit einem | Jedes Foto kann mit mehreren|
|         | Tag gekennzeichnet werden                 | Tags gekennzeichnet werden |

#### follows

Ist eine Unäre Beziehung von Users 

- Jeder Follower kann mehreren Followees folgen
- Jeder Followee kann mehrere Follower besitzen

|         | **Beteiligung**                 | **Kardinalität**    |
|-------  | ---------------                 | ---------------     |
| Users   | 0                               | N                   |
|         | Jeder follower muss keinem followee folgen  | Jeder follower kann mehreren followees folgen    |
| Users  | 0                               | M       |
|         | Jeder followee muss keinen follower | Jeder followee kann von mehreren|
|         | besitzen                 | followern gefolgt werden |

### Typische Operationen

- Ausgabe aller Posts eines Benutzers
- Ausgabe aller Follower eines Benutzers
- Ausgabe aller Followees des Benutzers
- Ausgabe aller likes eine Benutzers und deren user_name

### weitere relevante Informationen

Im nachfolgend sind weitere relevanten Informationen aufgelistet, die bei der Erstellung der Datenbank
und Auswahl des Datenbanksystems zu beachten sind.

#### Datenmengen

Über das Datenvolumen der Datenbank lässt sich an dieser Stelle noch keine ganz 
genaue Aussage treffen. Unter anderem fehlen Informationen, in welchem Format und Auflösung die 
Bilder später gespeichert werden und ob auch noch Videos und andere Metadaten hinzu kommen werden.

Es ist allerdings davon auszugehen das das die Datenbank schnell mehrere TB groß
werden kann.

#### Gesetzliche Bestimmungen

Da wir uns im Internet bewegen sind die jeweiligen Rechtsbestimmungen aller Länder
zu beachten. Besonders in Hinsicht auf Datenschutz und möglicher (Anti-) Zensurgesetze.

Wir werden uns in der ersten Phasen nur auf den europäischen Markt konzentrieren
und nehmen die [Europäische Datenschutz-Grundverordnung ](https://www.bmwi.de/Redaktion/DE/Artikel/Digitale-Welt/europaeische-datenschutzgrundverordnung.html) sowie nationale Regelungen als
mindestmaß für unser Konzept.

Zudem sind strafrechtliche Bestimmungen der einzelnen Länder zu beachten.

#### Sicherung der Datenbank

Wir können uns keine Downtimes der Datenbank erlauben, da wir uns auf einem globalen
Markt bewegen. 
Die Datenbank wird als micro-service in einem orchestrierten Container-cluster
laufen. Sie wird durch Replizierung gegen einen Ausfall gesichert und jeweils asynchron auf externe 
Sicherungshubs verteilt.

#### Zeichensatz

Als Zeichensatz werden wir UTF-8 einsetzen.

## Entity Relationship-Modell

### Gesamtdarstellung

![Gesamtübersicht SEISMIK](img/ERModell_all.pdf)

### Detaildarstellung

Jede Entität wird nachfolgend detailliert mit den dazugehörigen Attributen dargestellt.

#### USERS

![SEISMIK - Entität USERS](img/ERModell_USERS.pdf) 

#### PHOTOS

![SEISMIK - Entität PHOTOS](img/ERModell_PHOTOS.pdf) 

#### TAGS

![SEISMIK - Entität TAGS](img/ERModell_TAGS.pdf) 

## Relationenmodell

![](img/Relationship.pdf) 

## Normalisierung

An dieser Stelle sollen nur die ersten 3 Normalformen betrachtet werden.

1. Normalform
   Alle Attribute weisen nur atomare Werte auf.

2. Normalform:
   Da die 1. Normalform erfüllt ist und alle Primärschlüssel aus künstlichen
   Schlüsseln gebildet werden, liegt die 2. Normalform vor.

3. Normalform:
   Die 2. Normalform liegt vor und es existieren keine Nichtschlüsselattribute,
   die transitiv vom Primärschlüssel abhängen. Somit ist die 3. Normalform
   ebenfalls gegeben.

## Datenbankobjekte

Zum Erstellen der Datenbankobjekte wird ein Benutzer benötigt, der über ausreichende Rechte verfügt.

### Tabellen

- Erstellung aller vorher aufgelisteten Tabellen von SEISMIK
- löschen bereits vorhandener Tabellen

Script: ...

### Test-Datensätze

Zum Testen der Datenbank werden einige typische Datensätze in die entsprechenden Tabellen
eingefügt.

Skript:

Aufgabe des Skriptes:
Um immer von denselben Testdatensätzen auszugehen, werden aus den Tabellen zunächst die
eventuell vorhandenen Datensätze gelöscht und anschließend eingefügt.

## Datenmanipulation

Die Manipulation der Daten erfolgt durch interaktive Eingabe der Werte.

## Datenabfrage

## Menügestaltung
