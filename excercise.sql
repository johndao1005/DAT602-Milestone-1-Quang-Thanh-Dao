drop table if exists `writer` ;

CREATE TABLE `writer` (
  `poet` varchar(50) default NULL,
  `anthology` varchar(40) default NULL,
  `copies_in_stock` tinyint(4) 
  		default NULL
);
 
INSERT INTO `writer` VALUES 
('Mongane Wally Serote','Tstetlo',3),
('Mongane Wally Serote',
	'No Baby Must Weep',8),
('Mongane Wally Serote',
	'A Tough Tale',2),
('Douglas Livingstone',
	 'The Skull in the Mud',21),
('Douglas Livingstone',
	'A Littoral Zone',2);
    
-- SELECT poet,SUM(copies_in_stock) FROM writer GROUP BY poet;

-- SELECT * FROM writer;

SELECT poet,

MAX(copies_in_stock) max,

MIN(copies_in_stock) min,

AVG(copies_in_stock) avg,

SUM(copies_in_stock) sum

FROM writer GROUP BY poet;