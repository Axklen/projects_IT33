---
title: "Axinsta Documentation"
author: [Daniel Schwarz]
date: "07.11.2021"
subject: "Markdown"
keywords: [Documentation, Axinsta]
subtitle: "Dokumentation"
lang: "de"
titlepage: true,
titlepage-rule-color: "01a4ad"
titlepage-text-color: "004857"
titlepage-background: "backgrounds/bgtitle.pdf"
header-left: "\\leftmark"
footer-left: "\\thetitle"
footer-center: "\\theauthor"
footer-right: "Seite \\thepage"
listings-no-page-break: true
toc-own-page: true
footnotes-pretty: true
header-includes: |
  \usepackage{sectsty, xcolor}
  \sectionfont{\clearpage}
  \hypersetup{
    colorlinks=false,
    pdfborderstyle={/S/U/W 1},  % underline links instead of boxes
    linkbordercolor=white,      % color of internal links
    citebordercolor=green,      % color of links to bibliography
    filebordercolor=magenta,    % color of file links
    urlbordercolor=black        % color of external links
  }
...

# Axinsta

## Vorwort

Diese Dokumentation wurde für mein Projekt bei [Cimdata](https://www.cimdata.de/)
mit Oracle SQL erstellt.

Aufgabe ist es, eine kleine Datenbank anzulegen und mittels SQL-Scripten via
dem commandline-tool sqlplus/sqlcl ein kleines "Programm" zu erstellen.

Die SQL-Scripte sollen:

- eine Datenbank anlegen
- die erforderlichen Tabellen erstellen
- Dummy Daten in die Tabellen einfügen
- eine Menüstruktur zur wiederholten Ausführung anbieten
- man soll folgendes im Menü auswählen können
  - Datenbank aufsetzten
  - Datensätze löschen
  - Datensätze anlegen
  - einige Datenabfragen realisieren
  - Datenbank löschen

Ich habe hierbei mit Gnu/Linux - Fedora Silverblue[^e] - gearbeitet. Um den Oracle
SQL Server aufzusetzen habe ich Podman, also ein Containertool, verwendet um
den Server in einem Container aufzusetzen.

Zur Dokumentation habe ich Markdown benutzt und dieses mit
dem Tool [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) in eine PDF-Datei gerendert.

```{.bash caption="Eisvogel cl-Befehl"}
pandoc documentation.md -o documentation.pdf --from markdown --template eisvogel -V lang=de --shift-heading-level-by=-1 --toc --number-sections --listings
```

[^e]: Immutable OS - Gnome DE

TODO:presentation

## Aufgabenstellung

Entwickeln Sie eine Datenbank für die Firma: blahhhhh

## Grobstruktur

Die "Cocktail – Event Service" wurde von 2 IHK-Auszubildenden zur Fachkraft im
Gastgewerbe ins Leben gerufen. Zunächst stand nur der Spaß im Vordergrund,
um bei gelegentlichen Veranstaltungen, die im Freundeskreis stattfanden,
bei der Gestaltung mitzuwirken. Dann kamen die ersten privaten
Feste im familiären Umfeld dazu.
Nach erfolgreichem Bestehen der IHK-Prüfung kam die Idee auf, dies
professioneller zu betreiben. Es kam zur Gründung der "Cocktail –Event Service".
Die Cocktails werden mehr oder weniger nach einem "einheitlichen" Rezept
zubereitet. Soll heißen, dass beispielsweise ein bestimmter Cocktail durch beide
Eigentümer unterschiedlich zubereitet wird.
So variieren die Alkoholmengen, die Beilagen und die Gläser bei ein und
demselben Cocktail. Was im privaten Umfeld noch akzeptiert wurde,
war aber öfters Kritikpunkt bei den Kunden. Leider konnte nicht immer über die
Gesamtdauer der Veranstaltung bestimmte Cocktails angeboten werden, da die dazu
benötigten Zutaten ausgingen. Aber auch bei der benötigten Anzahl an
Gläsern hapert es auch schon mal.

Zum Glück musste erst eine Veranstaltung wegen einer Doppelplanung absagt werden.
Glücklicherweise hatte der Kunde im Vorfeld 2 Alternativ-Termine genannt.
Die "Cocktail – Event Service" benötigt eine Datenbank zur elektronischen
Verwaltung folgender Punkte:

- Erfassen von Cocktails aus aller Welt mit einheitlicher Zutatenliste,
  Erscheinungsbild und Zubereitung

- In einer weiteren Ausbaustufe ist geplant:
  Terminplanung von Event-Veranstaltungen

## Feinstruktur

Beschreibung der Art vom Projekt

### Reference Erklärung (Instagram)

#### Entität 1 Erklärung

#### Entität 2 Erklärung

### Relevante Objekte

### Beziehungen

### Typische Operationen

### weitere relevante Informationen

#### Datenmengen

#### Gesetzliche Bestimmungen

#### Sicherung der Datenbank

#### Zeichensatz

## Entity Relationship-Modell

### Gesamtdarstellung

![ER-Model](img/testpdf.pdf)

### Detaildartsellung

## Relationenmodell

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

### Tabellen

### Test-Datensätze

## Datenmanipulation

Die Manipulation der Daten erfolgt durch interaktive Eingabe der Werte.

## Datenabfrage

## Menügestaltung
