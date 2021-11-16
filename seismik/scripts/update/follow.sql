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
PROMPT " Benutzer folgen =>"

-- zeige Benutzer ohne den eigenen benutzer und bereits gefolgte user
SELECT 
  id AS ID,
  username AS Benutzername
FROM users
WHERE id != &&v_user
MINUS
SELECT
  id,
  username
FROM users u
RIGHT JOIN follows f
ON f.followee_id = u.id
WHERE f.follower_id = &&v_user;

PROMPT " "
PROMPT " "
ACCEPT input PROMPT " ID zum Folgen eingeben: "   

INSERT INTO follows(follower_id, followee_id) VALUES (&&v_user,&input); 

COMMIT;

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
SELECT
  username AS "Ich folge"
FROM users u
RIGHT JOIN follows f
ON f.followee_id = u.id
WHERE f.follower_id = &&v_user;

SELECT
  username AS "mir folgt"
FROM users u
RIGHT JOIN follows f
ON f.follower_id = u.id
WHERE f.followee_id = &&v_user;

PROMPT " "
PROMPT " "
PROMPT " "
PROMPT " wie soll es weitergehen?"
PROMPT " ·················································"
PROMPT " "
-- NOTE: einem benutzer unfollen
PROMPT " [ 1 ] => einem weiteren Benutzer folgen?"
PROMPT " -------------------------------------------------"
PROMPT " [ z ] => ZURÜCK"
PROMPT " [ h ] =>  ZURÜCK zum Hauptmenü"
PROMPT " [ q ] =>  Anwendung BEENDEN"
PROMPT " "
ACCEPT input2 PROMPT " Ihre Auwahl => "
PROMPT " ·················································"

--weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input2'
   WHEN '1' THEN 'like.sql'
   WHEN 'z' THEN 'menu.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice 
