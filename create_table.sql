USE `323termproject`;

DROP TABLE IF EXISTS `bill_item`;
DROP TABLE IF EXISTS `scheduled_shift`;
DROP TABLE IF EXISTS `shift`;
DROP TABLE IF EXISTS `party_table`;
DROP TABLE IF EXISTS `party`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `mini_business`;
DROP TABLE IF EXISTS `online_order`;
DROP TABLE IF EXISTS `phone_order`;
DROP TABLE IF EXISTS `to_go`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `menu_to_item`;
DROP TABLE IF EXISTS `kids_menu`;
DROP TABLE IF EXISTS `buffet_menu`;
DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `spice_rating`;
DROP TABLE IF EXISTS `meat`;
DROP TABLE IF EXISTS `maitre_d`;
DROP TABLE IF EXISTS `dish_washer`;
DROP TABLE IF EXISTS `wait_staff`;
DROP TABLE IF EXISTS `part_time`;
DROP TABLE IF EXISTS `sous_chef_dish`;
DROP TABLE IF EXISTS `mentorship`;
DROP TABLE IF EXISTS `mastered_dish`;
DROP TABLE IF EXISTS `menu_item`;
DROP TABLE IF EXISTS `dish`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `head_chef`;
DROP TABLE IF EXISTS `sous_chef`;
DROP TABLE IF EXISTS `station_assignment`;
DROP TABLE IF EXISTS `cook_station`;
DROP TABLE IF EXISTS `station`;
DROP TABLE IF EXISTS `line_cook`;
DROP TABLE IF EXISTS `chef`;
DROP TABLE IF EXISTS `manager`;
DROP TABLE IF EXISTS `full_time`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `dine_in`;
DROP TABLE IF EXISTS `seat`;
DROP TABLE IF EXISTS `table`;
DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `sectionID` int(10) NOT NULL,
  `numTables` int(2) NOT NULL,
  `maxPpl` int(2) NOT NULL,
  PRIMARY KEY (`sectionId`)
);

CREATE TABLE `table` (
  `tableID` int(10) NOT NULL,
  `sectionID` int(10) NOT NULL,
  `capacity` int(2) NOT NULL,
  PRIMARY KEY (`tableId`),
  CONSTRAINT `table_fk_1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`)
);

CREATE TABLE `seat` (
  `seatID` int(10) NOT NULL,
  `tableID` int(10) NOT NULL,
  `positionNum` int(10) NOT NULL,
  PRIMARY KEY (`seatId`, `tableID`),
  CONSTRAINT `seat_fk_1` FOREIGN KEY (`tableID`) REFERENCES `table` (`tableID`)
);

CREATE TABLE `dine_in` (
  `seatID` int(10) NOT NULL,
  `tableID` int(10) NOT NULL,
  `sectionId` int(10) NOT NULL,
  PRIMARY KEY (`seatId`, `tableID`, `sectionId`),
  CONSTRAINT `dine_in_fk_1` FOREIGN KEY (`seatID`) REFERENCES `seat` (`seatID`),
  CONSTRAINT `dine_in_fk_2` FOREIGN KEY (`tableID`) REFERENCES `table` (`tableID`),
  CONSTRAINT `dine_in_fk_3` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`)
);

CREATE TABLE `employee` (
  `empID` int(10) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phone` int(10) NOT NULL,
  PRIMARY KEY (`empID`)
);

CREATE TABLE `full_time` (
  `empID` int(10) NOT NULL,
  `payrate` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `full_time_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`)
);

CREATE TABLE `manager` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `manager_fk_1` FOREIGN KEY (`empID`) REFERENCES `full_time` (`empID`)
);

CREATE TABLE `chef` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `full_time` (`empID`)
);

CREATE TABLE `line_cook` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `line_cook_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

CREATE TABLE `station` (
  `station_name` varchar(50) NOT NULL,
  PRIMARY KEY (`station_name`)
);

CREATE TABLE `cook_station` (
  `empID` int(10) NOT NULL,
  `station_name` varchar(50) NOT NULL,
  PRIMARY KEY (`empID`, `station_name`),
  CONSTRAINT `cook_station_fk_1` FOREIGN KEY (`empID`) REFERENCES `line_cook` (`empID`),
  CONSTRAINT `cook_station_fk_2` FOREIGN KEY (`station_name`) REFERENCES `station` (`station_name`)
);

CREATE TABLE `station_assignment` (
  `station_name` varchar(50) NOT NULL,
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`station_name`, `empID`),
  CONSTRAINT `station_assignment_fk_1` FOREIGN KEY (`station_name`) REFERENCES `cook_station` (`station_name`),
  CONSTRAINT `station_assignment_fk_2` FOREIGN KEY (`empID`) REFERENCES `line_cook` (`empID`)
);

CREATE TABLE `sous_chef` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `sous_chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

CREATE TABLE `head_chef` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `head_chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

CREATE TABLE `recipe` (
  `empID` int(10) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`empID`, `dish_name`),
  KEY `dish_name` (`dish_name`),
  CONSTRAINT `recipe_fk_1` FOREIGN KEY (`empID`) REFERENCES `head_chef` (`empID`)
);

CREATE TABLE `ingredient` (
  `ingredient` varchar(50) NOT NULL,
  PRIMARY KEY (`ingredient`)
);

CREATE TABLE `dish` (
  `ingredient` varchar(50) NOT NULL,
  `empID` int(10) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ingredient`, `empID`, `dish_name`),
  CONSTRAINT `dish_fk_1` FOREIGN KEY (`ingredient`) REFERENCES `ingredient` (`ingredient`),
  CONSTRAINT `dish_fk_2` FOREIGN KEY (`empId`, `dish_name`) REFERENCES `recipe` (`empId`, `dish_name`)
);

CREATE TABLE `menu_item` (
  `dish_name` varchar(50) NOT NULL,
  `dish_type` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`dish_name`),
  CONSTRAINT `menu_item_fk_1` FOREIGN KEY (`dish_name`) REFERENCES `recipe` (`dish_name`)
);

CREATE TABLE `mastered_dish` (
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dish_name`),
  CONSTRAINT `mastered_dish_fk_1` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`)
);

CREATE TABLE `mentorship` (
  `studentID` int(10) NOT NULL,
  `sous_teacher` int(10) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`studentID`, `sous_teacher`, `dish_name`),
  CONSTRAINT `mentorship_fk_1` FOREIGN KEY (`studentID`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `mentorship_fk_2` FOREIGN KEY (`sous_teacher`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `mentorship_fk_3` FOREIGN KEY (`dish_name`) REFERENCES `mastered_dish` (`dish_name`)
);

CREATE TABLE `sous_chef_dish` (
  `empID` int(10) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`empID`, `dish_name`),
  CONSTRAINT `sous_chef_dish_fk_1` FOREIGN KEY (`empID`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `sous_chef_dish_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `mastered_dish` (`dish_name`)
);

CREATE TABLE `part_time` (
  `empID` int(10) NOT NULL,
  `wage` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `part_time_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`)
);

CREATE TABLE `wait_staff` (
  `sectionID` int(10) NOT NULL,
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`sectionId`, `empID`),
  CONSTRAINT `wait_staff_fk_1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`),
  CONSTRAINT `wait_staff_fk_2` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

CREATE TABLE `dish_washer` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `dish_washer_fk_1` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

CREATE TABLE `maitre_d` (
  `empID` int(10) NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `maitre_d_fk_1` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

CREATE TABLE `meat` (
  `meat_name` varchar(30) NOT NULL,
  PRIMARY KEY (`meat_name`)
);

CREATE TABLE `spice_rating` (
  `rating_name` varchar(30) NOT NULL,
  PRIMARY KEY (`rating_name`)
);

CREATE TABLE `menu` (
  `menu_type` varchar(20) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`menu_type`)
);

CREATE TABLE `buffet_menu` (
  `menu_type` varchar(20) NOT NULL,
  `price_for_buffet` int(10) NOT NULL,
  PRIMARY KEY (`menu_type`),
  CONSTRAINT `buffet_menu_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`)
);

CREATE TABLE `kids_menu` (
  `menu_type` varchar(20) NOT NULL,
  `price_to_color` int(10) NOT NULL,
  `age` int(2) NOT NULL,
  PRIMARY KEY (`menu_type`),
  CONSTRAINT `kids_menu_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`)
);

CREATE TABLE `menu_to_item` (
  `menu_type` varchar(20) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `meat_name` varchar(30) NOT NULL,
  `rating_name` varchar(30) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`menu_type`, `dish_name`, `meat_name`, `rating_name`),
  CONSTRAINT `menu_to_item_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`),
  CONSTRAINT `menu_to_item_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`),
  CONSTRAINT `menu_to_item_fk_3` FOREIGN KEY (`meat_name`) REFERENCES `meat` (`meat_name`),
  CONSTRAINT `menu_to_item_fk_4` FOREIGN KEY (`rating_name`) REFERENCES `spice_rating` (`rating_name`)
);

CREATE TABLE `customer` (
  `customer_name` varchar(20) NOT NULL,
  `payment_name` varchar(20) NOT NULL,
  `customer_email` varchar(20) NOT NULL,
  `current_balance` int(10) NOT NULL,
  `street_name_number` varchar(30) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `account_number` int(20) NOT NULL,
  KEY (`payment_name`),
  PRIMARY KEY (`customer_name`)
);

CREATE TABLE `order` (
  `customer_name` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `comments` varchar(50) NOT NULL,
  `total` int(10) NOT NULL,
  PRIMARY KEY (`customer_name`),
  CONSTRAINT `order_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`)
);

CREATE TABLE `to_go` (
  `customer_name` varchar(20) NOT NULL,
  `time_ready` time NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `time_picked_up` time NOT NULL,
  PRIMARY KEY (`customer_name`),
  CONSTRAINT `to_go_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `order` (`customer_name`)
);

CREATE TABLE `phone_order` (
  `customer_name` varchar(20) NOT NULL,
  `phone_number` int(10) NOT NULL,
  PRIMARY KEY (`customer_name`),
  CONSTRAINT `phone_order_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `to_go` (`customer_name`)
);

CREATE TABLE `online_order` (
  `customer_name` varchar(20) NOT NULL,
  `card_credentials` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_name`),
  CONSTRAINT `online_order_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `to_go` (`customer_name`)
);

CREATE TABLE `mini_business` (
  `customer_name` varchar(20) NOT NULL,
  `corporation_name` varchar(20) NOT NULL,
  `department` varchar(50) NOT NULL,
  `contact_phone` int(10) NOT NULL,
  PRIMARY KEY (`customer_name`, `corporation_name`),
  CONSTRAINT `mini_business_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`)
);

CREATE TABLE `payment` (
  `payment_name` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_name`),
  CONSTRAINT `payment_fk_1` FOREIGN KEY (`payment_name`) REFERENCES `customer` (`payment_name`)
);

CREATE TABLE `party` (
  `party_leader` varchar(20) NOT NULL,
  `size` int(2) NOT NULL,
  PRIMARY KEY (`party_leader`),
  CONSTRAINT `party_fk_1` FOREIGN KEY (`party_leader`) REFERENCES `customer` (`customer_name`)
);

CREATE TABLE `party_table` (
  `party_leader` varchar(20) NOT NULL,
  `tableID` int(10) NOT NULL,
  PRIMARY KEY (`party_leader`, `tableID`),
  CONSTRAINT `party_table_fk_1` FOREIGN KEY (`party_leader`) REFERENCES `party` (`party_leader`),
  CONSTRAINT `party_table_fk_2` FOREIGN KEY (`tableID`) REFERENCES `table` (`tableID`)
);

CREATE TABLE `shift` (
  `shift_date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`shift_date`, `start`, `end`)
);

CREATE TABLE `scheduled_shift` (
  `empID` int(10) NOT NULL,
  `shift_date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`empID`, `shift_date`, `start`, `end`),
  CONSTRAINT `scheduled_shift_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  CONSTRAINT `scheduled_shift_fk_2` FOREIGN KEY (`shift_date`, `start`, `end`) REFERENCES `shift` (`shift_date`, `start`, `end`)
);

CREATE TABLE `bill_item` (
  `customer_name` varchar(20) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_name`, `dish_name`),
  CONSTRAINT `bill_item_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `order` (`customer_name`),
  CONSTRAINT `bill_item_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`)
);
