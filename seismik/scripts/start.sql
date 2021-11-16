cl scr
SET ECHO OFF
SET VERIFY ON
SET FEEDBACK ON

PROMPT " 﫥d.schwarz                               Axklen"
PROMPT " ·················································" 
PROMPT "                                                  " 
PROMPT " ███████╗███████╗██╗███████╗███╗   ███╗██╗██╗  ██╗"
PROMPT " ██╔════╝██╔════╝██║██╔════╝████╗ ████║██║██║ ██╔╝"
PROMPT " ███████╗█████╗  ██║███████╗██╔████╔██║██║█████╔╝ "
PROMPT " ╚════██║██╔══╝  ██║╚════██║██║╚██╔╝██║██║██╔═██╗ "
PROMPT " ███████║███████╗██║███████║██║ ╚═╝ ██║██║██║  ██╗"
PROMPT " ╚══════╝╚══════╝╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚═╝  ╚═╝"
PROMPT "                                                  "
PROMPT " Login                                            "
PROMPT " ·················································"
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

