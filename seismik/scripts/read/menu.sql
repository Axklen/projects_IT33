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
PROMPT " [ 1 ] => Meine Fotos mit Kommentare/Likes-Count anzeigen"
PROMPT " [ 2 ] => 3 Top followed Benutzer"
PROMPT " [ 3 ] => neuste Kommentare eines Bildes mit Benutzername"
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
   WHEN '1' THEN 'userphotos.sql'
   WHEN '2' THEN 'top3f.sql'
   WHEN '3' THEN 'neusteK.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice
