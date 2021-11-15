cl scr
SET ECHO OFF
SET VERIFY ON
SET FEEDBACK ON

PROMPT " " 
PROMPT "   /$$$$$$  /$$$$$$$$ /$$$$$$  /$$$$$$  /$$      /$$ /$$$$$$ /$$   /$$"
PROMPT "  /$$__  $$| $$_____/|_  $$_/ /$$__  $$| $$$    /$$$|_  $$_/| $$  /$$/"
PROMPT " | $$  \__/| $$        | $$  | $$  \__/| $$$$  /$$$$  | $$  | $$ /$$/ "
PROMPT " |  $$$$$$ | $$$$$     | $$  |  $$$$$$ | $$ $$/$$ $$  | $$  | $$$$$/  "
PROMPT "  \____  $$| $$__/     | $$   \____  $$| $$  $$$| $$  | $$  | $$  $$  "
PROMPT "  /$$  \ $$| $$        | $$   /$$  \ $$| $$\  $ | $$  | $$  | $$\  $$ "
PROMPT " |  $$$$$$/| $$$$$$$$ /$$$$$$|  $$$$$$/| $$ \/  | $$ /$$$$$$| $$ \  $$"
PROMPT "  \______/ |________/|______/ \______/ |__/     |__/|______/|__/  \__/"
PROMPT "                                                by Daniel Schwarz@IT33"
PROMPT " Willkommen im Hauptmenu                                              "
PROMPT " ====================================================================="
PROMPT " "
PROMPT " Bitte wählen Sie eine der folgenden Optionen"
PROMPT " "
PROMPT " [ 1 ] => Datenbankstruktur bearbeiten"
PROMPT " [ 2 ] => Benuterauswahl / -wechsel"
PROMPT " [ 3 ] => LESEN spezifischer Datensätze"
PROMPT " [ 4 ] => ÄNDERN von Datensätzen"
PROMPT " ---------------------------------------------------------------------"
PROMPT " [ q ] => Anwendung BEENDEN"
PROMPT " "
ACCEPT input PROMPT " Ihre Auswahl: "
PROMPT " "

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