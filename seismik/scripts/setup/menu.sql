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
PROMPT " Datenbankstruktur                             by Daniel Schwarz@IT33"
PROMPT " ===================================================================="
PROMPT " "
PROMPT " Bitte wählen Sie eine der folgenden Optionen"
PROMPT " "
PROMPT " [ 1 ] => Datenbankstrucktur ERSTELLEN/resetten "
PROMPT " [ 2 ] => Beispieldatensätze EINFÜGEN"
PROMPT " --------------------------------------------------------------------"
PROMPT " [ h ] => ZURÜCK zum Hauptmenü"
PROMPT " [ q ] => Anwendung BEENDEN"
PROMPT " "
ACCEPT input PROMPT " Ihre Auswahl => "
PROMPT " "

-- weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input'
   WHEN '1' THEN 'db_table_install.sql'
   WHEN '2' THEN 'insert_data.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice
