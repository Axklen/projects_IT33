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
PROMPT " Bilder eines Benutzers anzeigen                by Daniel Schwarz@IT33"
PROMPT " ====================================================================="

-- zeige Benutzer
SELECT 
  u.id AS "Benutzer ID",
  u.username AS Benutzer,
  count(p.image_url) as Bilder
FROM 
  users u
JOIN
  photos p
ON u.id = p.user_id
GROUP BY u.id, u.username
ORDER BY u.id
;

PROMPT " "
ACCEPT input PROMPT " Wählen Sie eine Benutzer ID => "
PROMPT " "
cl scr

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
PROMPT " Bilder eines Benutzers                         by Daniel Schwarz@IT33"
PROMPT " ====================================================================="

SET HEA OFF 
-- SET FEED OFF
-- show selected user
PROMPT " ausgewählter Benutzer:"
SELECT username AS Benutzer
FROM users
WHERE id = &input;
SET HEA ON 

-- show photos of user with like count and comment count
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
WHERE u.id = &input
GROUP BY p.image_url, c.comment_text, p.created_at;

-- SELECT 
--   DISTINCT p.image_url AS Bild,
--   to_char(max(p.created_at), 'DD.MM.YYYY') AS gepostet,
--   count(l.photo_id) AS likes,
--   count(c.comment_text) AS comments,
-- FROM photos p
-- LEFT JOIN users u
-- ON p.user_id = u.id
-- LEFT JOIN comments c
-- ON p.id = c.photo_id
-- LEFT JOIN likes l
-- ON p.id = l.photo_id
-- LEFT JOIN photo_tags t
-- ON t.photo_id = p.id
-- LEFT JOIN tags ta
-- ON t.tag_id = ta.id
-- WHERE u.id = &input
-- GROUP BY p.image_url, c.comment_text, p.created_at;

PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT "=========================================="
PROMPT " "
PROMPT " [ 1 ] => einen anderen Benutzer wählen"
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
   WHEN '1' THEN 'userphotos.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON


@&v_choice
