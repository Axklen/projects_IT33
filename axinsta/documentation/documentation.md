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

Ich habe hierbei mit Gnu/Linux - Fedora Silverblue - gearbeitet. Um den Oracle
SQL Server aufzusetzen habe ich Podman, also ein Containertool, verwendet um
den Server in einem Container aufzusetzen.

Zur Dokumentation habe ich Markdown benutzt und dieses mit
dem Tool [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) in eine PDF-Datei gerendert.

```{.bash caption="Eisvogel cl-Befehl"}
pandoc documentation.md -o documentation.pdf --from markdown --template eisvogel -V lang=de --shift-heading-level-by=-1 --toc --number-sections --listings
```

TODO:presentation

## Kundenauftrag

## Grobstruktur

## Feinstruktur

## ER-Modell

![ER-Model](img/testpdf.pdf)

![ER-Model](img/testpdf.pdf)

![ER-Model](img/testpdf.pdf)

![ER-Model](img/testpdf.pdf)

![ER-Model](img/testpdf.pdf)

## Relationenmodell
