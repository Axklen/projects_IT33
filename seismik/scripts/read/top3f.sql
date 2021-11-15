cl scr
SET ECHO OFF
SET VERIFY OFF
SET FEEDBACK OFF

PROMPT " " 
PROMPT "   /$$$$$$  /$$$$$$$$ /$$$$$$  /$$$$$$  /$$      /$$ /$$$$$$ /$$   /$$"
PROMPT "  /$$__  $$| $$_____/|_  $$_/ /$$__  $$| $$$    /$$$|_  $$_/| $$  /$$/"
PROMPT " | $$  \__/| $$        | $$  | $$  \__/| $$$$  /$$$$  | $$  | $$ /$$/ "
PROMPT " |  $$$$$$ | $$$$$     | $$  |  $$$$$$ | $$ $$/$$ $$  | $$  | $$$$$/  "
PROMPT "  \____  $$| $$__/     | $$   \____  $$| $$  $$$| $$  | $$  | $$  $$  "
PROMPT "  /$$  \ $$| $$        | $$   /$$  \ $$| $$\  $ | $$  | $$  | $$\  $$ "
PROMPT " |  $$$$$$/| $$$$$$$$ /$$$$$$|  $$$$$$/| $$ \/  | $$ /$$$$$$| $$ \  $$"
PROMPT "  \______/ |________/|______/ \______/ |__/     |__/|______/|__/  \__/"
PROMPT "                                                                      "
PROMPT " TOP 5 liked Bilder                             by Daniel Schwarz@IT33"
PROMPT " ====================================================================="

-- bilderausgabe
-- zeige Benutzer
SELECT 
count(l.photo_id) AS likes,
p.image_url AS Bilder
FROM photos p
RIGHT JOIN likes l
ON p.id = l.photo_id
GROUP BY p.image_url
ORDER BY 1 DESC;


PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT "=========================================="
PROMPT " "
PROMPT " [ z ] => ZURÜCK"
PROMPT " [ h ] => ZURÜCK zum Hauptmenü"
PROMPT " [ q ] => Anwendung BEENDEN"
PROMPT " "
ACCEPT input2 PROMPT " Ihre Auwahl => "
PROMPT "=========================================="

--weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input2'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON


@&v_choice
