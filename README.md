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
執行結果:
![[Pasted image 20230731181105.png]]
# 第三題
1. 使⽤ INSERT 指令新增⼀筆資料到 member 資料表中，這筆資料的 username 和 password 欄位必須是 test。接著繼續新增⾄少 4 筆隨意的資料。使⽤ SELECT 指令取得所有在 member 資料表中的會員資料。
![image](https://github.com/eunicezhou/week5/assets/131647842/9553227a-04be-46bf-a137-d2c19701c0f4)
2. 使⽤ SELECT 指令取得所有在 member 資料表中的會員資料，並按照 time 欄位，由近到遠排序。
![image](https://github.com/eunicezhou/week5/assets/131647842/48b93864-5720-41ab-a9de-2e6062a9b102)
3. 使⽤ SELECT 指令取得 member 資料表中第 2 到第 4 筆共三筆資料，並按照 time 欄 位，由近到遠排序。( 並非編號 2、3、4 的資料，⽽是排序後的第 2 ~ 4 筆資料 )
![image](https://github.com/eunicezhou/week5/assets/131647842/a54a5769-b1e1-4451-83e7-b0f8dfd39eec)
4. 使⽤ SELECT 指令取得欄位 username 是 test 的會員資料。
![image](https://github.com/eunicezhou/week5/assets/131647842/0494286b-99be-4534-8db9-b4696dab72f5)
5. 使⽤ SELECT 指令取得欄位 username 是 test、且欄位 password 也是 test 的資料。
![image](https://github.com/eunicezhou/week5/assets/131647842/4f792874-f01a-4ae3-b23f-66534a7d7a66)
6. 使⽤ UPDATE 指令更新欄位 username 是 test 的會員資料，將資料中的 name 欄位改 成 test2。
![image](https://github.com/eunicezhou/week5/assets/131647842/f5b2d5ad-a2f2-4c2b-aae0-ec2c9523fb80)

# 第四題
1. 取得 member 資料表中，總共有幾筆資料 ( 幾位會員 )。
![image](https://github.com/eunicezhou/week5/assets/131647842/0db78863-f907-48aa-ba58-a483f2406228)
2. 取得 member 資料表中，所有會員 follower_count 欄位的總和。
![image](https://github.com/eunicezhou/week5/assets/131647842/ecdc0262-39ce-4031-b50b-43714c878818)
4. 取得 member 資料表中，所有會員 follower_count 欄位的平均數。
![image](https://github.com/eunicezhou/week5/assets/131647842/6912a4cc-3466-428b-bf04-49aecf0d4b88)

# 第五題
1. 使⽤ SELECT 搭配 JOIN 語法，取得所有留⾔，結果須包含留⾔者的姓名。
![image](https://github.com/eunicezhou/week5/assets/131647842/b147bc70-3af8-46cd-ab8c-e5f577b3b46d)
2. 使⽤ SELECT 搭配 JOIN 語法，取得 member 資料表中欄位 username 是 test 的所有留⾔，資料中須包含留⾔者的姓名。
![image](https://github.com/eunicezhou/week5/assets/131647842/200cedc2-65c1-45f7-b0e3-3c4a4d177cf6)
3. 使⽤ SELECT、SQL Aggregate Functions 搭配 JOIN 語法，取得 member 資料表中欄位 username 是 test 的所有留⾔平均按讚數。
![image](https://github.com/eunicezhou/week5/assets/131647842/f6953333-4215-434c-a070-06d71f1d285e)
