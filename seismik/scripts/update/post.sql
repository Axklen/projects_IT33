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
PROMPT "  Bild posten =>"
PROMPT " "
ACCEPT url PROMPT " Bitte eine Bild url angeben (https://...): "   

INSERT INTO photos (image_url, user_id) VALUES ('&url', &&v_user); 

COMMIT;

SET TERM OFF

-- grab imagecount
COLUMN imgc NEW_VALUE v_img_anz

SELECT
  count(image_url) AS imgc
FROM users u
RIGHT JOIN photos p
ON p.user_id = u.id
WHERE p.user_id = &&v_user;

SET TERM ON

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
PROMPT "  meine Fotos =>"

SELECT
  DISTINCT p.image_url AS Fotos,
  to_char(p.created_at, 'DD.MM.YYYY') AS gepostet,
  count(l.photo_id) AS likes,
  count(c.comment_text) AS comments
FROM photos p
LEFT JOIN users u
ON p.user_id = u.id
LEFT JOIN comments c
ON p.id = c.photo_id
LEFT JOIN likes l
ON p.id = l.photo_id
WHERE u.id = &&v_user
GROUP BY p.image_url, c.comment_text, p.created_at;

PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT "··················································"
PROMPT " "
PROMPT " [ 1 ]   weiteres Foto posten?"
PROMPT " [ 2 ]  ﴩ Foto löschen"
PROMPT " -------------------------------------------------"
PROMPT " [ z ]  » ZURÜCK"
PROMPT " [ h ]   ZURÜCK zum Hauptmenü"
PROMPT " [ q ]   Anwendung BEENDEN"
PROMPT " "
PROMPT "··················································"
ACCEPT input2 PROMPT " Ihre Auwahl => "

--weiterleitung nach auswahl
-- SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input2'
   WHEN '1' THEN 'post.sql'
   WHEN '2' THEN 'delete.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

@&v_choice 
