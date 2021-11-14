cl scr
SET ECHO OFF
SET VERIFY ON
SET FEEDBACK ON

PROMPT " "
PROMPT "=> delete all tables" 
PROMPT "=========================================="
-- tables with FKs
DROP TABLE comments;
DROP TABLE likes;
DROP TABLE follows;
DROP TABLE photo_tags;
DROP TABLE photos;

-- tables with w/o FKs
DROP TABLE users;
DROP TABLE tags;

PROMPT " "
PROMPT "=> CREATE TABLES" 
PROMPT "=========================================="
-- create all tables, first w/o FKs
CREATE TABLE users
(
  id NUMBER GENERATED ALWAYS as IDENTITY 
            CONSTRAINT pk_users_id PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  passwd VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT sysdate
);

CREATE TABLE tags
(
  id NUMBER GENERATED ALWAYS as IDENTITY 
            CONSTRAINT pk_tags_id PRIMARY KEY, 
  tag_name VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT sysdate
);

CREATE TABLE photos
(
  id NUMBER GENERATED ALWAYS as IDENTITY 
            CONSTRAINT pk_photos PRIMARY KEY, 
  image_url VARCHAR(255) NOT NULL,
  user_id NUMBER NOT NULL,
  created_at TIMESTAMP DEFAULT sysdate,
  CONSTRAINT fk_photos_user_id FOREIGN KEY (user_id) REFERENCES users(id)
  DEFERRABLE INITIALLY DEFERRED
);

-- with FKs
CREATE TABLE comments
(
  id NUMBER GENERATED ALWAYS as IDENTITY 
            CONSTRAINT pk_comments PRIMARY KEY, 
  comment_text VARCHAR(255) NOT NULL,
  user_id NUMBER NOT NULL,
  photo_id NUMBER NOT NULL,
  created_at TIMESTAMP DEFAULT sysdate,
  CONSTRAINT fk_comments_user_id FOREIGN KEY (user_id) REFERENCES users(id)
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT fk_comments_photo_id FOREIGN KEY (photo_id) REFERENCES photos(id) 
  DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE likes
(
  user_id NUMBER,
  photo_id NUMBER,
  created_at TIMESTAMP DEFAULT sysdate,
  CONSTRAINT fk_likes_user_id FOREIGN KEY (user_id) REFERENCES users(id) 
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT fk_likes_photo_id FOREIGN KEY (photo_id) REFERENCES photos(id) 
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT pk_likes PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows
(
  follower_id NUMBER,
  followee_id NUMBER,
  created_at TIMESTAMP DEFAULT sysdate,
  CONSTRAINT fk_follows_follower_id FOREIGN KEY (follower_id) REFERENCES users(id) 
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT fk_follows_followee_id FOREIGN KEY (followee_id) REFERENCES users(id) 
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT pk_follows PRIMARY KEY (followee_id, follower_id)
);

CREATE TABLE photo_tags
(
  photo_id NUMBER,
  tag_id NUMBER,
  CONSTRAINT fk_photo_tags_photo_id FOREIGN KEY (photo_id) REFERENCES photos(id)
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT fk_photo_tag_tag_id FOREIGN KEY (tag_id) REFERENCES tags(id)
  DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT pk_photo_id PRIMARY KEY (photo_id, tag_id)
);

PROMPT " "
PROMPT " << finished setting up Tables >>"
PROMPT "=========================================="
PROMPT " "
PROMPT " zurück zum Menü mit <enter>"
PAUSE
@menu.sql
