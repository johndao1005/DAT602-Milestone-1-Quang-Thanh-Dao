use GameScriptsDb;

drop procedure if exists CREATEDB ;
DELIMITER //
create procedure CREATEDB()
begin
	
	drop table if exists `Type`,  `User`, `Map`, `Character`, `Chat_log`, `Session`;
 
    create table `User` (
    `userID` int not null primary key auto_increment,
    `email` varchar(255) not null,
    `username` varchar(255),
    `password` varchar(255),
    `login_check` BOOL,
    `login_attempt` int default 3,
    `admin_check` bool default false,
    `highest_score` int
	);
     create table `Type` (
      `typeID` int not null auto_increment,
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
		`timestamp` timestamp,
		`userID` integer(100) not null,
		foreign key (`userID`) references `User` (`userID`)
	);
end //
    DELIMITER ;
    call CREATEDB();
    
drop procedure if exists INSERT_DATA ;
DELIMITER //
create procedure INSERT_DATA()
begin
	insert into `Type`(`tile_name`,`description`)
    value ('grass','something to step on');
    insert into `User`(`email`,`username`,`password`,`login_check`,`login_attempt`,`admin_check`,`highest_score`)
    value ('tim@tim.tim','just tim','password1',true,3,false,0);
    insert into `Chat_log`(`content`,`timestamp`,`userID`)
    value ('what a day',16/03/2013, 1);
    insert into `Map`
    value (1,1,1,1);
    insert into `Character`
    value (1,12,true,1,1),(2,12,true,1,1);
    insert into `Session`
    value (1,1,2,"1000-01-01 00:00:00");	
end //
    DELIMITER ;
    call INSERT_DATA();
    
drop procedure if exists UPDATE_DATA;

DELIMITER //
create procedure UPDATE_DATA()
begin
	update `Type`
    set  `tile_name` = 'floor'
    where `typeID`=1;
	update `Map`
    set  `row` = 2,`column`=2
   where `locationID`=1;
	update `Chat_log`
    set  `content` = 'This message is udpated'
    where `messageID`=1;
	update `User`
    set  `email` = 'updated_email@gmail.com'
    where `userID`=1;
    update `Session`
    set  `time_start` = '1000-01-01 00:00:00'
    where `sessionId`=1;
end //
    DELIMITER ;
    call UPDATE_DATA();

 
drop procedure if exists SELECT_DATA;
	select 
DELIMITER //
create procedure SELECT_DATA()
begin
	select * from `Session`;
    select * from `Character`;
    select * from `Chat_log`;
    select * from `User`;
    select * from `Map`;
    select * from `Type`;
end //
DELIMITER ;
call SELECT_DATA();
    
drop procedure if exists DELETE_DATA;

DELIMITER //
create procedure DELETE_DATA()
begin
	delete from `Chat_log` where `messageID`=1;
	delete from `Session` where `sessionID`=1;
	delete from `User` where `userID`=1;
	delete from `Map` where `locationID`=1;
	delete from `Character` where `characterID`=1;
	delete from `Type` where `typeID`=1;
end //
DELIMITER ;
call DELETE_DATA();
   
