-- drop database if exists FoodieDB;
-- create database FoodieDB;
-- uncomment when create new database

use FoodieDB;

drop procedure if exists CREATEDB;
drop procedure if exists SendMessage;
drop procedure if exists CreateUser;

DELIMITER //

-- DATABASE INIT
create procedure CREATEDB()
begin
	drop table if exists `TileType`,  `User`, `Map`, `Character`, `Chat_log`, `Session`;
 
    create table `User` (
    `userID` int not null primary key auto_increment,
    `email` varchar(255) not null,
    `username` varchar(255),
    `password` varchar(255),
    `login_check` BOOL default true,
    `login_attempt` int default 3,
    `admin_check` bool default false,
    `highest_score` int default 0
	);
     create table `TileType` (
      `typeID` int not null,
      `tile_name` varchar(255) not null,
      `description` varchar(100) default null,
      primary key (`typeID`)
    );
    
    create table `Map` (
      `locationID` int not null auto_increment primary key,
      `row` int not null,
      `column` int not null,
      `typeID` int not null,
      foreign key (`typeID`) references `Type`(`typeID`) on delete cascade
    );
    
    create table `Character` (
    `characterID` int not null primary key,
    `current_score` int,
    `power_up` bool default false,
    `userID` int,
    `locationID` int,
    foreign key (`userID`) references `User`(`userID`)  on delete cascade,
    foreign key (`locationID`) references `Map`(`locationID`)
    );

	create table `Session` (
    `sessionID` int not null primary key,
    `characterID_1` int not null,
    `characterID_2` int not null,
    `time_start` datetime not null,
    foreign key (`characterID_1`) references `character`(`characterID`),
    foreign key (`characterID_2`) references `character`(`characterID`)
    );

	create table `Chat_log` (
		`messageID` int not null primary key auto_increment,
		`content` varchar(712),
		`timestamp` timestamp default now(),
		`userID` integer(100) not null,
		foreign key (`userID`) references `User` (`userID`)
	);
end //

-- GAME FUNCTIONS

-- Map
create procedure PrebuildMap()
begin
	insert into  `TileType`(`typeID`,`tile_name`,`description`)
	value(1,'grass','Normal tile to tramp over and destroy the environment'),
    (2,'concrete','Stable foothold at the cost of nature'),
    (3,'wall','When you hit a wall please turn around, it is a WALL'),
    (4,'ice','Hope you can go over it easily with slipping');
end //  





-- Type setup
create procedure CreateTileType()
begin
	insert into  `TileType`(`typeID`,`tile_name`,`description`)
	value(1,'grass','Normal tile to tramp over and destroy the environment'),
    (2,'concrete','Stable foothold at the cost of nature'),
    (3,'wall','When you hit a wall please turn around, it is a WALL'),
    (4,'ice','Hope you can go over it easily with slipping');
end //  

-- Session
create procedure CreateSession(in characterID_1 int,in characterID_2 int)
begin
	insert into `Session`(`characterID_1`,`characterID_2`)
	value(characterID_1,characterID_1);
end // 

create procedure DeleteSession(in sessionID int)
begin
	delete from `Session` where `sessionID`= sessionID; 
end // 


-- Message
create procedure SendMessage(in Content varchar(712), in ID integer(100))
begin
	insert into `Chat_log`(`content`,`userID`)
    value(Content,ID);
end //

-- User procedures
create procedure CreateUser(in Email varchar(255), in Username varchar(255), in Password varchar(255) )
begin
	insert into `User`(`email`,`username`,`password`)
    value(Email,Username,Password);
end //

create procedure EditUSer(in `userID` int, in Username varchar(255), in Password varchar(255),in Email varchar(255) )
begin
    update `User`
    set`email` = Email,
	`username` =Username,
	`password` = Password
	where `userID`=1;
end //

-- UNCONSTRUCTION

create procedure AuthUser(in Email varchar(255), in Password varchar(255) )
begin
	-- get the user info match email
    
    -- check if password match
    
    -- check if user is admin
end //

create procedure DeleteUser(in UserID int )
begin
	
    -- Find all character relate to current userID then pass
    
    -- Find all session relate to the chracterID then pass
    call DeleteSession();
    -- Need to delete the character and session relate to user as well\
    delete from `User` where `userID`=UserID;
end //

-- Character procedures

create procedure CreateCharacter(in UserID int )
begin
	insert into `Character`(`email`,`username`,`password`)
    value(Email,Username,Password);
end //

create procedure ResetCharacter(in UserID int )
begin
	update `User`
    set`email` = Email,
	`username` =Username,
	`password` = Password
	where `userID`=1;
end //

create procedure ResetCharacter(in UserID int )
begin
	update `User`
    set`email` = Email,
	`username` =Username,
	`password` = Password
	where `userID`=1;
end //

DELIMITER ;

-- CALLING PROCUDURES AND FUNCTIONS
-- call CREATEDB(); 
-- delete from `Chat_log` where `messageID`=1;
-- 	update `Type`
--  set  `tile_name` = 'floor'
-- where `typeID`=1;

call CreateUser("hello","hello","helloa");
 