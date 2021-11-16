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
PROMPT "  Bild liken =>"

-- alle bilder anzeigen / nicht meins / id bildname / insg likes 
SELECT 
  i.id AS ID,
  i.image_url AS Bild,
 count(l.photo_id) AS likes
FROM photos i
LEFT JOIN likes l
ON l.photo_id = i.id
WHERE i.id NOT IN 
(
  SELECT photo_id FROM likes WHERE user_id = &&v_user
)
GROUP BY i.id, i.image_url
ORDER BY i.id; 

-- eine auswahl anfordern
PROMPT " "
PROMPT " "
ACCEPT input PROMPT " ID zum Liken eingeben => "   

-- inserting data
INSERT INTO likes (user_id, photo_id)
VALUES (&&v_user, &input);
-- saving transaction
COMMIT;

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
PROMPT " [ 1 ]   ein weiteres Foto liken"
PROMPT " [ 2 ]   ein Foto unliken"
PROMPT " -------------------------------------------------"
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
   WHEN '1' THEN 'like.sql'
   WHEN '2' THEN 'unlike.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice 
