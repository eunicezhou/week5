# week5
# 第二題
在資料庫中，建立會員資料表 member。並設定欄位格式:
1. 創建一個website的資料庫
```mysql
CREATE DATABASE `website`;
SHOW DATABASES;
USE `website`;
```
2. 建立一個名稱為member的資料表，並將每個欄位的欄位名稱及資料型態格式訂好
```mysql
CREATE TABLE `member`(
`id` BIGINT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`username` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`follower_count` INT UNSIGNED NOT NULL DEFAULT 0,
`time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```
3. 檢查一下欄位資料型態以及格式
```mysql
DESCRIBE `member`;
```

![image](https://github.com/eunicezhou/week5/assets/131647842/0480432f-55b7-4cef-9b9d-9c825ad15d13)

# 第三題
1. 使⽤ INSERT 指令新增⼀筆資料到 member 資料表中，這筆資料的 username 和 password 欄位必須是 test。接著繼續新增⾄少 4 筆隨意的資料。使⽤ SELECT 指令取得所有在 member 資料表中的會員資料。
```mysql
SELECT * FROM `member`;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/09aff70d-2726-4cfb-b01f-5997978ce108)

2. 使⽤ SELECT 指令取得所有在 member 資料表中的會員資料，並按照 time 欄位，由近到遠排序。
```
SELECT * FROM `member` ORDER BY `time`DESC;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/7907e145-7655-40e3-bf47-e8be013a2864)

3. 使⽤ SELECT 指令取得 member 資料表中第 2 到第 4 筆共三筆資料，並按照 time 欄 位，由近到遠排序。( 並非編號 2、3、4 的資料，⽽是排序後的第 2 ~ 4 筆資料 )
```
SELECT * FROM `member` ORDER BY `time`DESC LIMIT 3 OFFSET 1;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/330b6d58-f9d9-4057-9ab0-c97df0527948)

4. 使⽤ SELECT 指令取得欄位 username 是 test 的會員資料。
```
SELECT * FROM `member` WHERE `username` = "test";
```
![image](https://github.com/eunicezhou/week5/assets/131647842/d2271d4f-da9f-4ad5-9976-1d8105230a27)

5. 使⽤ SELECT 指令取得欄位 username 是 test、且欄位 password 也是 test 的資料。
```
SELECT * FROM `member` WHERE `username` = "test" and `password` = "test";
```
![image](https://github.com/eunicezhou/week5/assets/131647842/f6e71614-2606-40c9-900c-2b33461c2a84)

6. 使⽤ UPDATE 指令更新欄位 username 是 test 的會員資料，將資料中的 name 欄位改 成 test2。
```
// 關閉安全設置
SET SQL_SAFE_UPDATES=0; 
// 更新資料表中username為"test"的資料，並將其name改成"test2"
UPDATE `member` SET `name` = "test2" WHERE `username`="test";
// 取出該筆資料
SELECT * FROM `member` WHERE `username` = "test";
```
![image](https://github.com/eunicezhou/week5/assets/131647842/367f98af-4637-4478-a502-742f89cc4589)


# 第四題
1. 取得 member 資料表中，總共有幾筆資料 ( 幾位會員 )。
```
SELECT COUNT(`id`) FROM `member`;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/603e4a8e-42f5-497a-a651-00add57a9753)

2. 取得 member 資料表中，所有會員 follower_count 欄位的總和。
```
SELECT SUM(`follower_count`) FROM member;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/1b1a0f62-f27f-4210-ae3c-70ce9444cd49)

3. 取得 member 資料表中，所有會員 follower_count 欄位的平均數。
```
SELECT AVG(`follower_count`) FROM member;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/b9579989-c42f-4f11-980b-4abcffc06d54)


# 第五題
前置作業:
```
// 建立資料表
CREATE TABLE `message`(
`id` BIGINT PRIMARY KEY AUTO_INCREMENT,
`member_id` BIGINT NOT NULL ,
`content` VARCHAR(255) NOT NULL,
`like_count` INT UNSIGNED NOT NULL DEFAULT 0,
`time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
// 檢查資料表欄位格式
DESCRIBE `message`;
// 在message資料表中的`member_id`和member資料表中的`id`間建立外鍵
ALTER TABLE `message` ADD FOREIGN KEY(member_id) REFERENCES `member`(id);
// 在message中輸入資料
INSERT INTO `message` (`member_id` , `content` , `like_count`,`time`) VALUES (2 , "What a shunny day!" , 200 , "2017/08/14");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (1,"I'm ugly",700,"2012/07/12");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (4,"I recommand go to Sun Moon Lake to have a happy camping vocation",600,"2022/08/11");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (1,"Hello World",900,"2012/07/12");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (6,"Show up",600,"2020/12/31");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (3,"Happy New Year",500,"2020/12/31");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (5,"To make people believe I'm still alive",1000,"2023/05/08");
INSERT INTO `message` (`member_id`,`content`,`like_count`,`time`) VALUES (4,"520 sunglasses holiday",2400,"2023/05/20");
```

1. 使⽤ SELECT 搭配 JOIN 語法，取得所有留⾔，結果須包含留⾔者的姓名。
```
SELECT member.name,message.content FROM member INNER JOIN message ON member.id = message.member_id ;
```
![image](https://github.com/eunicezhou/week5/assets/131647842/492e9587-b1e4-447e-8eec-0766d5b87421)


2. 使⽤ SELECT 搭配 JOIN 語法，取得 member 資料表中欄位 username 是 test 的所有留⾔，資料中須包含留⾔者的姓名。
```
SELECT member.username , message.content FROM member INNER JOIN message ON member.id = message.member_id WHERE member.username = "test";
```
![image](https://github.com/eunicezhou/week5/assets/131647842/9aa7aca8-401d-47d4-bdb6-5d860e57f79d)


3. 使⽤ SELECT、SQL Aggregate Functions 搭配 JOIN 語法，取得 member 資料表中欄位 username 是 test 的所有留⾔平均按讚數。
```
SELECT member.username , AVG(message.like_count) FROM `member` INNER JOIN `message` ON member.id = message.member_id WHERE member.username = "test";
```
![image](https://github.com/eunicezhou/week5/assets/131647842/94e9fcc3-720a-4b4f-9862-e5d75ef72496)

