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
PROMPT " Alle Fotos die Kommentare besitzen => "
SELECT 
  p.id AS "Foto ID",
  p.image_url AS Foto,
  count(c.comment_text) AS Kommentare
FROM 
  comments c
JOIN
  photos p
ON p.id = c.photo_id
GROUP BY p.id, p.image_url
ORDER BY 1
;

PROMPT " "
ACCEPT input PROMPT " Wählen Sie eine Foto ID => "
PROMPT " "

COLUMN img NEW_VALUE v_img

SELECT image_url AS img FROM photos WHERE id = &input;
cl scr

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
PROMPT " Kommentare für Foto => &&v_img"

-- show photos of user with like count and comment count
SELECT 
  c.comment_text AS Kommentar,
  to_char(c.created_at, 'DD.MM.YYYY | HH24:MI:SS') AS gepostet,
  u.username AS "post von"
FROM comments c
LEFT JOIN photos p
ON c.photo_id = p.id
LEFT JOIN users u
ON c.user_id = u.id
WHERE p.id = &input
ORDER BY c.created_at DESC
;

PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT " ·················································"
PROMPT " "
PROMPT " [ 1 ]   anderes Foto wählen"
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
   WHEN '1' THEN 'neusteK.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON


@&v_choice
