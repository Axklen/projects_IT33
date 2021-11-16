-- Beispieldatensätze einfügen
-- tables have to be dropped bevore cleaning up
-- auto increment is messing up internal indexes
-- ===============================================================
-- alle Tabellen leeren
PROMPT " "
PROMPT "=> clearing all tables" 
PROMPT "=========================================="
DELETE FROM users;
DELETE FROM photos;
DELETE FROM follows;
DELETE FROM comments;
DELETE FROM likes;
DELETE FROM tags;
DELETE FROM photo_tags;
commit;

-- neue Dummy-Datensätze einfügen
-- ===============================================================
-- Benutzer
PROMPT " "
PROMPT "=> insert USERS data" 
PROMPT "=========================================="
INSERT INTO users (username, passwd, created_at) VALUES ('Kenton_Kirlin', 'asdfeewsdfsdfs', sysdate);
INSERT INTO users (username, passwd, created_at) VALUES ('Axklen', 'sahhhhhasw', sysdate);
INSERT INTO users (username, passwd ) VALUES ('Poloi.al', 'jjjjdzzzz');
INSERT INTO users (username, passwd ) VALUES ('knastjunge', '123456789');
INSERT INTO users (username, passwd ) VALUES ('falsche-Wurst', 'passwort1');
INSERT INTO users (username, passwd ) VALUES ('fishman', 'passwort2');
INSERT INTO users (username, passwd ) VALUES ('kleinbein', 'gheweyyy332');
INSERT INTO users (username, passwd ) VALUES ('Watank233', 'sdfsfeesadd');

-- Fotos
PROMPT " "
PROMPT "=> insert photos data" 
PROMPT "=========================================="
INSERT INTO photos (image_url, user_id) VALUES ('https://elijah.biz', 1);
INSERT INTO photos (image_url, user_id) VALUES ('https://hsdasd.com/dsad.html', 1);
INSERT INTO photos (image_url, user_id) VALUES ('https://kratuwurst.biz', 3);
INSERT INTO photos (image_url, user_id) VALUES ('https://blueskraut.com', 4);
INSERT INTO photos (image_url, user_id) VALUES ('https://amalgan.de', 2);
INSERT INTO photos (image_url, user_id) VALUES ('https://ketaman.org', 3);
INSERT INTO photos (image_url, user_id) VALUES ('https://invalid.pic', 5);
INSERT INTO photos (image_url, user_id) VALUES ('https://ubermensch.val', 1);
INSERT INTO photos (image_url, user_id) VALUES ('https://klein.de', 8);
INSERT INTO photos (image_url, user_id) VALUES ('https://ulul.com', 3);
INSERT INTO photos (image_url, user_id) VALUES ('https://klar.org', 4);
INSERT INTO photos (image_url, user_id) VALUES ('https://hallo.welt', 7);
INSERT INTO photos (image_url, user_id) VALUES ('https://umu.mum', 8);
INSERT INTO photos (image_url, user_id) VALUES ('https://axklen.dev', 8);

-- follwing  
PROMPT " "
PROMPT "=> insert follows data" 
PROMPT "=========================================="
INSERT INTO follows (follower_id, followee_id) VALUES (2, 1); 
INSERT INTO follows (follower_id, followee_id) VALUES (2, 4); 
INSERT INTO follows (follower_id, followee_id) VALUES (3, 4); 
INSERT INTO follows (follower_id, followee_id) VALUES (3, 5); 
INSERT INTO follows (follower_id, followee_id) VALUES (3, 2); 
INSERT INTO follows (follower_id, followee_id) VALUES (1, 3); 
INSERT INTO follows (follower_id, followee_id) VALUES (8, 3); 
INSERT INTO follows (follower_id, followee_id) VALUES (4, 3); 
INSERT INTO follows (follower_id, followee_id) VALUES (8, 2); 
INSERT INTO follows (follower_id, followee_id) VALUES (1, 8); 
INSERT INTO follows (follower_id, followee_id) VALUES (2, 8); 
INSERT INTO follows (follower_id, followee_id) VALUES (7, 6); 
INSERT INTO follows (follower_id, followee_id) VALUES (7, 1); 
INSERT INTO follows (follower_id, followee_id) VALUES (4, 5); 

-- Kommentare
PROMPT " "
PROMPT "=> insert comments data" 
PROMPT "=========================================="
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('unde at dolorem', 2, 1, to_date('02.12.2020 19:22:33', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('etwas ist im haus', 2, 4, to_date('22.10.2021 09:02:42', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('alles gut', 3, 1, to_date('10.01.1999 19:59:32', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('blahhhhhhhh', 3, 1, to_date('13.06.2021 08:42:10', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('ey alla!', 8, 4, to_date('14.07.2010 08:14:43', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('Heftig', 5, 4, to_date('16.03.2008 09:50:00', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('Grobe Wurst', 8, 6, to_date('09.03.2021 23:20:55', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('Habe ich letzten auch gesehen, top!', 4, 4, to_date('30.12.2018 13:51:22', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('Bratwurst??', 8, 4, to_date('02.10.2021 14:11:44', 'DD.MM.YYYY HH24:MI:SS'));
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES ('nich ganz dicht oder wat', 1, 6, to_date('07.09.2019 18:39:40', 'DD.MM.YYYY HH24:MI:SS'));

-- likes
PROMPT " "
PROMPT "=> insert likes data" 
PROMPT "=========================================="
INSERT INTO likes (user_id, photo_id) VALUES (2, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 2); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 5); 
INSERT INTO likes (user_id, photo_id) VALUES (3, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (4, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (4, 8); 
INSERT INTO likes (user_id, photo_id) VALUES (4, 6); 
INSERT INTO likes (user_id, photo_id) VALUES (4, 2); 
INSERT INTO likes (user_id, photo_id) VALUES (6, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (5, 8); 
INSERT INTO likes (user_id, photo_id) VALUES (5, 6); 
INSERT INTO likes (user_id, photo_id) VALUES (5, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 8); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 7); 
INSERT INTO likes (user_id, photo_id) VALUES (7, 8); 

-- Tags
PROMPT " "
PROMPT "=> insert tags data" 
PROMPT "=========================================="
INSERT INTO tags (tag_name) VALUES ('katze');
INSERT INTO tags (tag_name) VALUES ('nice');
INSERT INTO tags (tag_name) VALUES ('baum');
INSERT INTO tags (tag_name) VALUES ('FAIL');
INSERT INTO tags (tag_name) VALUES ('corona1!11');
INSERT INTO tags (tag_name) VALUES ('blauschimmelkäse');

-- photo_tags
PROMPT " "
PROMPT "=> insert photo_tags data" 
PROMPT "=========================================="
INSERT INTO photo_tags (photo_id, tag_id) VALUES (1, 1); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (1, 2); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (2, 2); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (2, 5); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (3, 6); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (2, 3); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (14, 3); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (10, 3); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (8, 3); 
INSERT INTO photo_tags (photo_id, tag_id) VALUES (7, 1); 

PROMPT " "
PROMPT "=> saving inserted data"
PROMPT "=========================================="
COMMIT;

PROMPT " "
PROMPT " ««   finished inserting Dummy-Data  »»"
PROMPT " ·················································"
PROMPT " "
PROMPT " zurück zum Menü mit <enter>"
PAUSE
@menu.sql

