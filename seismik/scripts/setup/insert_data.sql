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

-- Kommentare
PROMPT " "
PROMPT "=> insert comments data" 
PROMPT "=========================================="
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('unde at dolorem', 2, 1);
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('etwas ist im haus', 2, 4);
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('alles gut', 3, 1);
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('blahhhhhhhh', 3, 1);
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('ey alla!', 4, 4);

-- likes
PROMPT " "
PROMPT "=> insert likes data" 
PROMPT "=========================================="
INSERT INTO likes (user_id, photo_id) VALUES (2, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 2); 
INSERT INTO likes (user_id, photo_id) VALUES (1, 5); 
INSERT INTO likes (user_id, photo_id) VALUES (3, 1); 
INSERT INTO likes (user_id, photo_id) VALUES (4, 1); 

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

PROMPT " "
PROMPT "=> saving inserted data"
PROMPT "=========================================="
COMMIT;

PROMPT " "
PROMPT " << finished inserting Dummy-Data >>"
PROMPT "=========================================="
PROMPT " "
PROMPT " zurück zum Menü mit <enter>"
PAUSE
@menu.sql

