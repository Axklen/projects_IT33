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
PROMPT "  Foto unliken =>"

-- anzeige gelikter bilder
SELECT
  DISTINCT
  i.id AS ID,
  i.image_url AS Foto,
  to_char(l.created_at,'DD.MM.YYYY | HH24:MI:SS') AS "geliked am"
FROM photos i
RIGHT JOIN likes l
ON l.photo_id = i.id
WHERE l.user_id = &&v_user
ORDER BY i.id; 

-- eine auswahl anfordern
PROMPT " "
PROMPT " "
ACCEPT unlike PROMPT " ID zum Un-liken eingeben => "   

-- deleteing data
DELETE FROM likes
WHERE user_id = &&v_user
  AND photo_id = &unlike;
-- saving transaction
COMMIT;

cl scr
-- neuer bildschirm 
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
PROMPT "  meine Likes =>"

-- anzeige gelikter bilder
SELECT
  DISTINCT
  i.id AS ID,
  i.image_url AS Foto,
  to_char(l.created_at,'DD.MM.YYYY | HH24:MI:SS') AS "geliked am"
FROM photos i
RIGHT JOIN likes l
ON l.photo_id = i.id
WHERE l.user_id = &&v_user
ORDER BY i.id; 

-- zeige Benutzer ohne den eigenen benutzer und bereits gefolgte user
PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT " ·················································"
PROMPT " "
PROMPT " [ 1 ]   weiteres Foto unliken"
PROMPT " [ 2 ]   Foto liken"
PROMPT " -------------------------------------------------"
PROMPT " [ z ]  » ZURÜCK"
PROMPT " [ h ]   ZURÜCK zum Hauptmenü"
PROMPT " [ q ]   Anwendung BEENDEN"
PROMPT " "
ACCEPT input2 PROMPT " Ihre Auwahl => "
PROMPT " ·················································"

--weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input2'
   WHEN '1' THEN 'unlike.sql'
   WHEN '2' THEN 'like.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice 
