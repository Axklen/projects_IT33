---
title: "Axinsta Documentation"
author: [Daniel Schwarz]
date: "07.11.2021"
subject: "Markdown"
keywords: [Documentation, Axinsta]
subtitle: "Dokumentation"
lang: "de"
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage: true,
titlepage-background: "backgrounds/bgtitleblue.pdf"
header-left: "\\hspace{1cm}"
header-center: "\\leftmark"
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
SQL Server aufzusetzen benutze ich [Podman](https://podman.io/), also ein Containertool - verwendet um
den Server in einem Container aufzusetzen.

Zur Dokumentation habe ich Markdown benutzt und dieses mit
dem Tool [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) in eine PDF-Datei gerendert.

```{.bash caption="Eisvogel cl-Befehl"}
pandoc documentation.md -o documentation.pdf --from markdown --template eisvogel -V lang=de --shift-heading-level-by=-1 --toc --number-sections --listings
```

[^e]: Immutable OS

TODO:presentation

## Aufgabenstellung

Entwickeln Sie eine Datenbank für die Firma: blahhhhh

## Grobstruktur

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

### Detaildarstellung

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
