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
PROMPT "                                                by Daniel Schwarz@IT33"
PROMPT " Bild posten | &&v_usern                                              "
PROMPT " ====================================================================="
PROMPT " "
ACCEPT url PROMPT " Bitte eine Bild url angeben (https://...): "   

INSERT INTO photos (image_url, user_id) VALUES ('&url', &&v_user); 

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
PROMPT " Bild posten | &&v_usern                                              "
PROMPT " ====================================================================="
PROMPT " "
PROMPT " meine Bilder =>"

SELECT
  DISTINCT p.image_url AS Bild,
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
PROMPT "=========================================="
PROMPT " "
PROMPT " [ 1 ] => noch ein Bild als &&v_usern posten?"
PROMPT " [ 2 ] => dieses Bild taggen"
PROMPT " --------------------------------------------------------------------"
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
   WHEN '1' THEN 'post_as_user.sql'
   WHEN '2' THEN 'tag.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice 
