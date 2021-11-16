cl scr
SET ECHO OFF
SET VERIFY ON
SET FEEDBACK ON

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
PROMPT " "
PROMPT " [ 1 ] => Bild Posten"
PROMPT " [ 2 ] => Bild Liken"
PROMPT " [ 3 ] => Einem Benutzer folgen"
PROMPT " -------------------------------------------------"
PROMPT " [ h ] =>  ZURÜCK zum Hauptmenü"
PROMPT " [ q ] =>  Anwendung BEENDEN"
PROMPT " "
ACCEPT input PROMPT " Ihre Auswahl => "
PROMPT " "

-- weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input'
   WHEN '1' THEN 'post.sql'
   WHEN '2' THEN 'like.sql'
   WHEN '3' THEN 'follow.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice
