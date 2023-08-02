CREATE DATABASE `website`;
SHOW DATABASES;
USE `website`;
CREATE TABLE `member`(
`id` BIGINT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`username` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`follower_count` INT UNSIGNED NOT NULL DEFAULT 0,
`time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE `member`;

INSERT INTO `member`(`name`,`username`,`password`,`follower_count`,`time`) VALUES("Jasmine","test","test",5000000,"1998-02-15 00:00:00");
INSERT INTO `member` (`name`,`username`,`password`,`follower_count`,`time`) VALUES("Sally","abcSally","aabbcc",1000000,"1989-07-20 00:00:00");
INSERT INTO `member` (`name`,`username`,`password`,`follower_count`,`time`) VALUES("Tommy","TTTommy","tommyeeee",20000000,"1999-12-23 00:00:00");
INSERT INTO `member` (`name`,`username`,`password`,`follower_count`,`time`) VALUES("Elix","Elixy","123456",50000000,"1978/08/25");
INSERT INTO `member` (`name`,`username`,`password`,`follower_count`,`time`) VALUES("Felix","feeee","2253893",300000,"2010/12/20");
INSERT INTO `member` (`name`,`username`,`password`,`follower_count`) VALUES("Belly","belly","bebebe",10000);

SELECT * FROM `member`;
SELECT * FROM `member` ORDER BY `time`DESC;
SELECT * FROM `member` ORDER BY `time`DESC LIMIT 3 OFFSET 1;
SELECT * FROM `member` WHERE `username` = "test";
SELECT * FROM `member` WHERE `username` = "test" and `password` = "test";

SET SQL_SAFE_UPDATES=0; 
UPDATE `member` SET `name` = "test2" WHERE `username`="test";
SELECT * FROM `member` WHERE `username` = "test";

SELECT COUNT(`id`) FROM `member`;
SELECT SUM(`follower_count`) FROM member;
SELECT AVG(`follower_count`) FROM member;

CREATE TABLE `message`(
`id` BIGINT PRIMARY KEY AUTO_INCREMENT,
`member_id` BIGINT NOT NULL ,
`content` VARCHAR(255) NOT NULL,
`like_count` INT UNSIGNED NOT NULL DEFAULT 0,
`time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
DESCRIBE `message`;
INSERT INTO `message` (`member_id` , `content` , `like_count`,`time`) VALUES (2 , "What a shunny day!" , 200 , "2017/08/14");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (1,"I'm ugly",700,"2012/07/12");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (4,"I recommand go to Sun Moon Lake to have a happy camping vocation",600,"2022/08/11");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (1,"Hello World",900,"2012/07/12");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (6,"Show up",600,"2020/12/31");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (3,"Happy New Year",500,"2020/12/31");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (5,"To make people believe I'm still alive",1000,"2023/05/08");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (4,"520 sunglasses holiday",2400,"2023/05/20");
SELECT * FROM `message`;
SELECT member.name , message.content FROM member INNER JOIN message ON member.id = message.member_id ;
SELECT member.username , message.content FROM `member` INNER JOIN `message` ON member.id = message.member_id WHERE member.username = "test";
SELECT member.username , AVG(message.like_count) FROM `member` INNER JOIN `message` ON member.id = message.member_id WHERE member.username = "test";
