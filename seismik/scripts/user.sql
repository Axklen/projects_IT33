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
PROMPT " Login                                            "
PROMPT " ·················································"
PROMPT "                                                  "

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

SET TERM OFF

-- garb username
COLUMN usr NEW_VALUE v_usern

SELECT username AS usr
FROM users
WHERE id = &input;

-- garb userID
COLUMN usrid NEW_VALUE v_user

SELECT &input AS usrid FROM dual;

-- grab followees
COLUMN folc NEW_VALUE v_following

SELECT
  count(username) AS folc
FROM users u
RIGHT JOIN follows f
ON f.follower_id = u.id
WHERE f.followee_id = &&v_user;

-- grab followers
COLUMN fole NEW_VALUE v_follower

SELECT
  count(username) AS fole
FROM users u
RIGHT JOIN follows f
ON f.followee_id = u.id
WHERE f.follower_id = &&v_user;

-- grab imagecount
COLUMN imgc NEW_VALUE v_img_anz

SELECT
  count(image_url) AS imgc
FROM users u
RIGHT JOIN photos p
ON p.user_id = u.id
WHERE p.user_id = &&v_user;

-- grab commentcount
COLUMN comc NEW_VALUE v_comments

SELECT
  count(comment_text) AS comc
FROM users u
RIGHT JOIN comments c
ON c.user_id = u.id
WHERE c.user_id = &&v_user;

SET TERM ON

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
WHERE u.id = &input
GROUP BY p.image_url, c.comment_text, p.created_at;

PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT "··················································"
PROMPT " "
PROMPT " [ u ] => Benutzer wechseln"
PROMPT " [ h ] =>  ZURÜCK zum Hauptmenü"
PROMPT " [ q ] =>  Anwendung BEENDEN"
PROMPT " "
ACCEPT input2 PROMPT " Ihre Auwahl => "
PROMPT "··················································"

--weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input2'
   WHEN 'u' THEN 'user.sql'
   WHEN 'h' THEN 'menu.sql'
   WHEN 'q' THEN 'quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice 
