#Tables are dropped if they already exist
DROP TABLE IF EXISTS `bill_item`;
DROP TABLE IF EXISTS `scheduled_shift`;
DROP TABLE IF EXISTS `shift`;
DROP TABLE IF EXISTS `party_table`;
DROP TABLE IF EXISTS `party`;
DROP TABLE IF EXISTS `mimi_business`;
DROP TABLE IF EXISTS `online_order`;
DROP TABLE IF EXISTS `phone_order`;
DROP TABLE IF EXISTS `to_go`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `payment`;
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
DROP TABLE IF EXISTS `line_cook`;
DROP TABLE IF EXISTS `chef`;
DROP TABLE IF EXISTS `manager`;
DROP TABLE IF EXISTS `full_time`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `dine_in`;
DROP TABLE IF EXISTS `seat`;
DROP TABLE IF EXISTS `Table`;
DROP TABLE IF EXISTS `section`;

#Section for tables with a unique ID, number of tables and maximum capacity
CREATE TABLE `section` (
  `sectionID` int NOT NULL,
  `numTables` int NOT NULL,
  `maxPpl` int NOT NULL,
  PRIMARY KEY (`sectionId`)
);

#Table where customers sit at with a unique ID, section ID where it is located, and a max capacity
CREATE TABLE `Table` (
  `tableID` int NOT NULL,
  `sectionID` int NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`tableId`),
  CONSTRAINT `table_fk_1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`)
);

#Seat at a able that a person can occupy with a unique ID, table is at, and position at the table
CREATE TABLE `seat` (
  `seatID` int NOT NULL,
  `tableID` int NOT NULL,
  `positionNum` int NOT NULL,
  PRIMARY KEY (`seatId`, `tableID`),
  CONSTRAINT `seat_fk_1` FOREIGN KEY (`tableID`) REFERENCES `Table` (`tableID`)
);

#Represents a customer who decides to dine-in at the restaurant at a seat at a table
CREATE TABLE `dine_in` (
  `seatID` int NOT NULL,
  `tableID` int NOT NULL,
  PRIMARY KEY (`seatId`, `tableID`),
  CONSTRAINT `dine_in_fk_1` FOREIGN KEY (`seatID`, `tableID`) REFERENCES `seat` (`seatID`, `tableID`)
);

#Employee working at the restaurant with a unique ID, name, and phone number
CREATE TABLE `employee` (
  `empID` int NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`empID`)
);

#Employee that works full-time with a unique ID and payrate
CREATE TABLE `full_time` (
  `empID` int NOT NULL,
  `payrate` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `full_time_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`)
);

#Full-time employee that functions as the manager of the restaurant
CREATE TABLE `manager` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `manager_fk_1` FOREIGN KEY (`empID`) REFERENCES `full_time` (`empID`)
);

#Full-time employee that works as a chef at the restaurant
CREATE TABLE `chef` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `full_time` (`empID`)
);

#Chef that works as a line cook
CREATE TABLE `line_cook` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `line_cook_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

#Station where line cooks can be assigned with a unique name for each station
CREATE TABLE `cook_station` (
  `station_name` varchar(50) NOT NULL,
  PRIMARY KEY (`station_name`)
);

#Assignment for the line cooks at the stations
CREATE TABLE `station_assignment` (
  `station_name` varchar(50) NOT NULL,
  `empID` int NOT NULL,
  PRIMARY KEY (`station_name`, `empID`),
  CONSTRAINT `station_assignment_fk_1` FOREIGN KEY (`station_name`) REFERENCES `cook_station` (`station_name`),
  CONSTRAINT `station_assignment_fk_2` FOREIGN KEY (`empID`) REFERENCES `line_cook` (`empID`)
);

#Chef who works as a sous chef
CREATE TABLE `sous_chef` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `sous_chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

#Chef that works as the head chef
CREATE TABLE `head_chef` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `head_chef_fk_1` FOREIGN KEY (`empID`) REFERENCES `chef` (`empID`)
);

#Recipe that the head shef makes with a unique dish name
CREATE TABLE `recipe` (
  `empID` int NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dish_name`),
  CONSTRAINT `recipe_fk_1` FOREIGN KEY (`empID`) REFERENCES `head_chef` (`empID`)
);

#Ingredient for the food
CREATE TABLE `ingredient` (
  `ingredient` varchar(50) NOT NULL,
  PRIMARY KEY (`ingredient`)
);

#Dish made with an ingredient from the chef's recipe
CREATE TABLE `dish` (
  `ingredient` varchar(50) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ingredient`, `dish_name`),
  CONSTRAINT `dish_fk_1` FOREIGN KEY (`ingredient`) REFERENCES `ingredient` (`ingredient`),
  CONSTRAINT `dish_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `recipe` (`dish_name`)
);

#Item in the menu that has a unique name and has a type and description
CREATE TABLE `menu_item` (
  `dish_name` varchar(50) NOT NULL,
  `dish_type` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`dish_name`),
  CONSTRAINT `menu_item_fk_1` FOREIGN KEY (`dish_name`) REFERENCES `recipe` (`dish_name`)
);

#Dish mastered by a chef
CREATE TABLE `mastered_dish` (
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dish_name`),
  CONSTRAINT `mastered_dish_fk_1` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`)
);

#Mentorship relationship between one sous chef and another with a start and end date of the teaching
CREATE TABLE `mentorship` (
  `studentID` int NOT NULL,
  `sous_teacher` int NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`studentID`, `sous_teacher`, `dish_name`),
  CONSTRAINT `mentorship_fk_1` FOREIGN KEY (`studentID`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `mentorship_fk_2` FOREIGN KEY (`sous_teacher`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `mentorship_fk_3` FOREIGN KEY (`dish_name`) REFERENCES `mastered_dish` (`dish_name`)
);

#Dish prepared by the sous chef as a mastered dish
CREATE TABLE `sous_chef_dish` (
  `empID` int NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`empID`, `dish_name`),
  CONSTRAINT `sous_chef_dish_fk_1` FOREIGN KEY (`empID`) REFERENCES `sous_chef` (`empID`),
  CONSTRAINT `sous_chef_dish_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `mastered_dish` (`dish_name`)
);

#Employee that works at the restaurant part-time wiht a wage
CREATE TABLE `part_time` (
  `empID` int NOT NULL,
  `wage` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `part_time_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`)
);

#Wait staff that work as part time workers at a section of the restaurant
CREATE TABLE `wait_staff` (
  `sectionID` int NOT NULL,
  `empID` int NOT NULL,
  PRIMARY KEY (`sectionId`, `empID`),
  CONSTRAINT `wait_staff_fk_1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`),
  CONSTRAINT `wait_staff_fk_2` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

#Dish washer that works part time at the restaurant
CREATE TABLE `dish_washer` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `dish_washer_fk_1` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

#Maitre d that works part time at the restaruant
CREATE TABLE `maitre_d` (
  `empID` int NOT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `maitre_d_fk_1` FOREIGN KEY (`empID`) REFERENCES `part_time` (`empID`)
);

#Meat with a unique name for a dish
CREATE TABLE `meat` (
  `meat_name` varchar(30) NOT NULL,
  PRIMARY KEY (`meat_name`)
);

#Rating of the spiciness of a dish
CREATE TABLE `spice_rating` (
  `rating_name` varchar(30) NOT NULL,
  PRIMARY KEY (`rating_name`)
);

#Menu that takes place from a start to end time every day at the restaurant
CREATE TABLE `menu` (
  `menu_type` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`menu_type`)
);

#Buffet style menu that has a menu type and price to enter
CREATE TABLE `buffet_menu` (
  `menu_type` varchar(20) NOT NULL,
  `price_for_buffet` float NOT NULL,
  PRIMARY KEY (`menu_type`),
  CONSTRAINT `buffet_menu_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`)
);

#Kids style menu that as a picture that can be colored and an age that can participate
CREATE TABLE `kids_menu` (
  `menu_type` varchar(20) NOT NULL,
  `pic_to_color` varchar(20) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`menu_type`),
  CONSTRAINT `kids_menu_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`)
);

#Item in the menu with all the details including the menu it is in, meat, spice rating, and price
CREATE TABLE `menu_to_item` (
  `menu_type` varchar(20) NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  `meat_name` varchar(30) NOT NULL,
  `rating_name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`menu_type`, `dish_name`, `meat_name`, `rating_name`),
  CONSTRAINT `menu_to_item_fk_1` FOREIGN KEY (`menu_type`) REFERENCES `menu` (`menu_type`),
  CONSTRAINT `menu_to_item_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`),
  CONSTRAINT `menu_to_item_fk_3` FOREIGN KEY (`meat_name`) REFERENCES `meat` (`meat_name`),
  CONSTRAINT `menu_to_item_fk_4` FOREIGN KEY (`rating_name`) REFERENCES `spice_rating` (`rating_name`)
);

#Name of the payment a customer makes
CREATE TABLE `payment` (
  `payment_name` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_name`)
);

#Customer at the restaurant with their personal details stored
CREATE TABLE `customer` (
  `customer_name` varchar(20) NOT NULL,
  `customer_email` varchar(20) NOT NULL,
  `current_balance` int NOT NULL,
  `street_name_number` varchar(30) NOT NULL,
  `zipcode` int NOT NULL,
  `account_number` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_name`)
);

#Order the customer makes with a date, time, payment name, and total they pay
CREATE TABLE `order` (
  `customer_name` varchar(20) NOT NULL,
  `date_ordered` date NOT NULL,
  `time_ordered` time NOT NULL,
  `payment_name` varchar(20) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`customer_name`, `date_ordered`, `time_ordered`),
  CONSTRAINT `order_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),
  CONSTRAINT `order_fk_2` FOREIGN KEY (`payment_name`) REFERENCES `payment` (`payment_name`)
);

#Order that a customer makes to leave the restaurant. It is ready at a time and picked up later
CREATE TABLE `to_go` (
  `customer_name` varchar(20) NOT NULL,
  `date_ordered` date NOT NULL,
  `time_ordered` time NOT NULL,
  `time_ready` time NOT NULL,
  `time_picked_up` time NOT NULL,
  PRIMARY KEY (`customer_name`, `date_ordered`, `time_ordered`),
  CONSTRAINT `to_go_fk_1` FOREIGN KEY (`customer_name`, `date_ordered`, `time_ordered`) REFERENCES `order` (`customer_name`, `date_ordered`, `time_ordered`)
);

#Order placed over the phone to-go. Phone number used is recorded
CREATE TABLE `phone_order` (
  `customer_name` varchar(20) NOT NULL,
  `date_ordered` date NOT NULL,
  `time_ordered` time NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`customer_name`, `date_ordered`, `time_ordered`),
  CONSTRAINT `phone_order_fk_1` FOREIGN KEY (`customer_name`, `date_ordered`, `time_ordered`) REFERENCES `to_go` (`customer_name`, `date_ordered`, `time_ordered`)
);

#Order placed online with a card that has credentials taken to process
CREATE TABLE `online_order` (
  `customer_name` varchar(20) NOT NULL,
  `date_ordered` date NOT NULL,
  `time_ordered` time NOT NULL,
  `card_credentials` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_name`, `date_ordered`, `time_ordered`),
  CONSTRAINT `online_order_fk_1` FOREIGN KEY (`customer_name`, `date_ordered`, `time_ordered`) REFERENCES `to_go` (`customer_name`, `date_ordered`, `time_ordered`)
);

#A customer that is a business so they have more details than an individual
CREATE TABLE `mimi_business` (
  `customer_name` varchar(20) NOT NULL,
  `corporation_name` varchar(20) NOT NULL,
  `department` varchar(50) NOT NULL,
  `contact_phone` int NOT NULL,
  PRIMARY KEY (`customer_name`, `corporation_name`),
  CONSTRAINT `mimi_business_fk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`)
);

#Party with many people as listed and one leader
CREATE TABLE `party` (
  `party_leader` varchar(20) NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`party_leader`),
  CONSTRAINT `party_fk_1` FOREIGN KEY (`party_leader`) REFERENCES `customer` (`customer_name`)
);

#Table where the party is taking place at
CREATE TABLE `party_table` (
  `party_leader` varchar(20) NOT NULL,
  `tableID` int NOT NULL,
  PRIMARY KEY (`party_leader`, `tableID`),
  CONSTRAINT `party_table_fk_1` FOREIGN KEY (`party_leader`) REFERENCES `party` (`party_leader`),
  CONSTRAINT `party_table_fk_2` FOREIGN KEY (`tableID`) REFERENCES `Table` (`tableID`)
);

#Shift for employees to work in on a specific date with a start and end time
CREATE TABLE `shift` (
  `shift_date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`shift_date`, `start`, `end`)
);

#Scheduled shift for an employee
CREATE TABLE `scheduled_shift` (
  `empID` int NOT NULL,
  `shift_date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`empID`, `shift_date`, `start`, `end`),
  CONSTRAINT `scheduled_shift_fk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  CONSTRAINT `scheduled_shift_fk_2` FOREIGN KEY (`shift_date`, `start`, `end`) REFERENCES `shift` (`shift_date`, `start`, `end`)
);

#Item on the bill for a customer
CREATE TABLE `bill_item` (
  `customer_name` varchar(20) NOT NULL,
  `date_ordered` date NOT NULL,
  `time_ordered` time NOT NULL,
  `dish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_name`, `date_ordered`, `time_ordered`, `dish_name`),
  CONSTRAINT `bill_item_fk_1` FOREIGN KEY (`customer_name`, `date_ordered`, `time_ordered`) REFERENCES `order` (`customer_name`, `date_ordered`, `time_ordered`),
  CONSTRAINT `bill_item_fk_2` FOREIGN KEY (`dish_name`) REFERENCES `menu_item` (`dish_name`)
);
