/* 1. */
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

/* 3. */
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

/* 3. */
DROP TRIGGER IF EXISTS `323termproject`.`cook_station_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `cook_station_BEFORE_INSERT` BEFORE INSERT ON `cook_station` FOR EACH ROW
BEGIN
if sum(empID) > 2 THEN
	signal sqlstate '45000' set message_text = 'Each station can have at most 2 cooks';
end if;
END$$
DELIMITER ;

/* 4. */
DROP TRIGGER IF EXISTS `323termproject`.`station_assignment_BEFORE_INSERT`;

DELIMITER $$
USE `323termproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `station_assignment_BEFORE_INSERT` BEFORE INSERT ON `station_assignment` FOR EACH ROW BEGIN
if (select empID from station_assignment where empID = new.empID) > 3 THEN
	signal sqlstate '45000' set message_text = 'Each line cook can have at most 3 stations assigned to them';
end if;
END$$
DELIMITER ;

/* 5. */
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
