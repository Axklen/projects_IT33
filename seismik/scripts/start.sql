cl scr
SET ECHO OFF
SET VERIFY ON
SET FEEDBACK ON

PROMPT " " 
PROMPT "  /$$$$$$  /$$$$$$$$ /$$$$$$  /$$$$$$  /$$      /$$ /$$$$$$ /$$   /$$"
PROMPT " /$$__  $$| $$_____/|_  $$_/ /$$__  $$| $$$    /$$$|_  $$_/| $$  /$$/"
PROMPT "  $$  \__/| $$        | $$  | $$  \__/| $$$$  /$$$$  | $$  | $$ /$$/ "
PROMPT "   $$$$$$ | $$$$$     | $$  |  $$$$$$ | $$ $$/$$ $$  | $$  | $$$$$/  "
PROMPT " \____  $$| $$__/     | $$   \____  $$| $$  $$$| $$  | $$  | $$  $$  "
PROMPT " /$$  \ $$| $$        | $$   /$$  \ $$| $$\  $ | $$  | $$  | $$\  $$ "
PROMPT "  $$$$$$/| $$$$$$$$ /$$$$$$|  $$$$$$/| $$ \/  | $$ /$$$$$$| $$ \  $$ "
PROMPT " \______/ |________/|______/ \______/ |__/     |__/|______/|__/  \__/"
PROMPT "                                                                     "
PROMPT " Login                                         by Daniel Schwarz@IT33"
PROMPT " ===================================================================="
PROMPT " "
PROMPT " "
ACCEPT usr PROMPT " Benutzername (Default: hr) => " DEFAULT hr
ACCEPT passwd PROMPT " Passwort (Default: hr) => " DEFAULT hr HIDE
ACCEPT db PROMPT " Datenbank (Default: XEPDB1) => " DEFAULT XEPDB1
PROMPT " "
CONNECT &usr/&passwd@localhost/&db
SHOW USER
PROMPT " "
PROMPT " Weiter zum Hauptmenu mit <enter> "
PAUSE 
@menu.sql

