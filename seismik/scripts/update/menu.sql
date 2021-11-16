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
PROMPT " [ 1 ]   posten"
PROMPT " [ 2 ]  ﴩ löschen"
PROMPT " [ 3 ]   liken"
PROMPT " [ 4 ]   unliken"
PROMPT " [ 5 ]   folgen"
PROMPT " [ 6 ]   unfollow"
PROMPT " -------------------------------------------------"
PROMPT " [ h ]   ZURÜCK zum Hauptmenü"
PROMPT " [ q ]   Anwendung BEENDEN"
PROMPT " "
ACCEPT input PROMPT " Ihre Auswahl => "
PROMPT " "

-- weiterleitung nach auswahl
SET TERM OFF

COLUMN virt_col new_value v_choice

SELECT
   CASE '&input'
   WHEN '1' THEN 'post.sql'
   WHEN '2' THEN 'delete.sql'
   WHEN '3' THEN 'like.sql'
   WHEN '4' THEN 'unlike.sql'
   WHEN '5' THEN 'follow.sql'
   WHEN '6' THEN 'unfollow.sql'
   WHEN 'h' THEN '../menu.sql'
   WHEN 'q' THEN '../quit.sql'
   END
AS virt_col
FROM dual;

SET TERM ON

@&v_choice
