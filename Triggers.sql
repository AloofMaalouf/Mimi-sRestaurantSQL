/* 1. 
Stops a waitstaff employee from being assigned to more than 1 section*/
DROP TRIGGER IF EXISTS `323termproject`.`wait_staff_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `wait_staff_BEFORE_INSERT` BEFORE INSERT ON `wait_staff` FOR EACH ROW 
BEGIN
if exists( select empID from wait_staff where empID = new.empID) THEN
	signal sqlstate '45000' set message_text = 'Wait Staff can only be assigned to one section';
end if;
END$$
DELIMITER ;

/* 2. 
Stops the added section from having more than 5 tables*/
DROP TRIGGER IF EXISTS `323termproject`.`section_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `section_BEFORE_INSERT` BEFORE INSERT ON `section` FOR EACH ROW 
BEGIN
if new.numTables > 5 THEN
	signal sqlstate '45000' set message_text = 'Each section can have at most 5 tables';
end if;
END$$
DELIMITER ;

/* 3. 
Stops a station from having more than 2 line cooks when a new cook is added*/
DROP TRIGGER IF EXISTS `323termproject`.`station_assignment_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `station_assignment_BEFORE_INSERT` BEFORE INSERT ON `station_assignment` FOR EACH ROW
BEGIN
if sum(empID) > 2 THEN
	signal sqlstate '45000' set message_text = 'Each station can have at most 2 cooks';
end if;
END$$
DELIMITER ;

/* 4. 
Stops the insertion of a new station assignment for a cook that already has the maximum of 3 stations
assigned to them*/
DROP TRIGGER IF EXISTS `323termproject`.`station_assignment_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `station_assignment_BEFORE_INSERT` BEFORE INSERT ON `station_assignment` FOR EACH ROW BEGIN
if (select count(empID) from station_assignment where empID = new.empID) > 3 THEN
	signal sqlstate '45000' set message_text = 'Each line cook can have at most 3 stations assigned to them';
end if;
END$$
DELIMITER ;

/* 5.
Stops the insertion of a scheduled shift without having at least 1 maitre d*/
DROP TRIGGER IF EXISTS `323termproject`.`scheduled_shift_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER = CURRENT_USER TRIGGER `323termproject`.`scheduled_shift_BEFORE_INSERT` BEFORE INSERT ON `scheduled_shift` FOR EACH ROW
BEGIN
if exists(
select count(empID)
from scheduled_shift natural join employee natural join part_time natural join maitre_d
where scheduled_shift.empID = maitre_d.empID
group by empID
having count(empID) < 1)
THEN
	signal sqlstate '45000' set message_text = 'There must be at least 1 maitre d per shift';
end if;

END$$
DELIMITER ;

/*Stops the deletion of a scheduled shift that would lead to there not being at least 1 maitre d per shift*/
DROP TRIGGER IF EXISTS `323termproject`.`scheduled_shift_BEFORE_DELETE`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER = CURRENT_USER TRIGGER `323termproject`.`scheduled_shift_BEFORE_DELETE` BEFORE DELETE ON `scheduled_shift` FOR EACH ROW
BEGIN
if exists(
select count(empID)
from scheduled_shift natural join employee natural join part_time natural join maitre_d
where scheduled_shift.empID = maitre_d.empID and OLD.empID = maitre_d.empID and old.empID = scheduled_shift.empID
group by empID
having count(empID) = 1)
THEN
	signal sqlstate '45000' set message_text = 'There must be at least 1 maitre d per shift';
end if;
END$$
DELIMITER ;
