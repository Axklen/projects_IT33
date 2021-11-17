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
PROMPT " Hauptmenü                                        "
PROMPT " ·················································"
PROMPT " "
PROMPT " ADMIN »"
PROMPT " [ 1 ]   Datenbankstruktur bearbeiten"
PROMPT " "
PROMPT " LOGIN »"
PROMPT " [ 2 ]   Benuterauswahl / -wechsel"
PROMPT " "
PROMPT " ACTIONS »"
PROMPT " [ 3 ]  龎LESEN spezifischer Datensätze"
PROMPT " [ 4 ]   ÄNDERN von Datensätzen"
PROMPT " "
PROMPT " EXIT »"
PROMPT " [ q ]   Anwendung BEENDEN"
PROMPT " "
PROMPT " ·················································"
PROMPT " "
ACCEPT input PROMPT " Ihre Auswahl => "
PROMPT " "
PROMPT " ·················································"

-- weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input'
   WHEN '1' THEN 'setup/menu.sql'
   WHEN '2' THEN 'user.sql'
   WHEN '3' THEN 'read/menu.sql'
   WHEN '4' THEN 'update/menu.sql'
   WHEN 'q' THEN 'quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice
