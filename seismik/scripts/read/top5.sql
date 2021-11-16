cl scr
SET ECHO OFF
SET VERIFY OFF
SET FEEDBACK OFF

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
PROMPT "  &&v_usern   &&v_img_anz   &&v_following   &&v_follower   &&v_comments  "
PROMPT " ·················································"
PROMPT " Top 5 liked Fotos =>"
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
PROMPT " ·················································"
PROMPT " "
PROMPT " [ z ]  » ZURÜCK"
PROMPT " [ h ]   ZURÜCK zum Hauptmenü"
PROMPT " [ q ]   Anwendung BEENDEN"
PROMPT " "
PROMPT " ·················································"
ACCEPT input2 PROMPT " Ihre Auwahl => "

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
