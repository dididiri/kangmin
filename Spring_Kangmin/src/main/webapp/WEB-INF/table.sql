
CREATE TABLE users(
id VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
email VARCHAR2(100),
regdate DATE
);

CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER, 
regdate DATE
);

CREATE SEQUENCE board_cafe_seq NOCACHE;

CREATE TABLE board_cafe_comment(
num NUMBER PRIMARY KEY, 
writer VARCHAR2(100),
content VARCHAR2(500),
target_id VARCHAR2(100),
ref_group NUMBER, 
comment_group NUMBER, 
regdate DATE
);

CREATE TABLE board_data
(num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER NOT NULL,
regdate DATE);

CREATE SEQUENCE board_data_seq NOCACHE;





