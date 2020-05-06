insert  into `section`(`sectionID`,`numTables`, `maxPpl`) values 
(1, 2, 4),
(2, 2, 8);

insert  into `table`(`tableID`,`sectionID` ,`capacity`) values 
(11, 1, 2),
(12, 1, 2),
(21, 2, 4),
(22, 2, 4);

insert  into `seat`(`seatID`, `tableID` ,`positionNum`) values 
(1, 11, 1),
(2, 11, 2),
(3, 12, 1),
(4, 12, 2),
(5, 21, 1),
(6, 21, 2),
(7, 21, 3),
(8, 21, 4),
(9, 22, 2),
(10, 22, 3),
(11, 22, 1),
(12, 22, 4);

insert  into `dine_in`(`seatID` ,`tableID` ,`sectionId`) values 
(1, 11, 1),
(2, 11, 1),
(4, 12, 1),
(7, 21, 2);

insert  into `employee`(`empID` ,`fname` ,`lname` ,`phone`) values 
(1, "George", "Washington", "1234567890"),
(2, "Abraham", "Lincoln", "2324543685"),
(3, "John", "Kennedy", "3426894596"),
(4, "Franklin", "Roosevelt", "2359543679"),
(5, "Ronald", "Reagan", "4355068036"),
(6, "George", "Bush", "2334859276"),
(7, "Barack", "Obama", "3048502845"),
(8, "David", "Brown", "9234576453"),
(9, "LeBron", "James", "9234676453"),
(10, "Michael", "Jordan", "9234846453"),
(11, "Kobe", "Bryant", "6572846453"),
(12, "Kevin", "Durant", "7878746473");


insert  into `full_time`(`empID`, `payrate`) values 
(1, 23000),
(2, 32500),
(4, 54000),
(6, 34000),
(7, 34500),
(8, 32500),
(9, 54000),
(10, 34000);

insert  into `manager`(`empID`) values 
(4);

insert  into `chef`(`empID`) values 
(1),
(2),
(6),
(7),
(8),
(9),
(10);

insert  into `line_cook`(`empID`) values 
(6);

insert  into `sous_chef`(`empID`) values 
(2),
(7),
(8),
(9),
(10);

insert  into `station`(`station_name`) values 
("Salad Station"),
("Meat Station");

insert  into `cook_station`(`empID`, `station_name`) values 
(6, "Salad Station");

insert  into `station_assignment`(`station_name`, `empID`) values 
("Salad Station", 6);

insert  into `head_chef`(`empID`) values 
(1);

insert  into `recipe`(`empID`, `dish_name`) values 
(1, "Spagetti"),
(1, "Burger"),
(1, "Tacos");

insert  into `ingredient`(`ingredient`) values 
("Beef"),
("Milk"),
("Cheese"),
("Noodles"),
("Tomatoes");

insert  into `dish`(`ingredient`, `empID`, `dish_name`) values 
("Beef", 1, "Tacos"),
("Milk", 1, "Spagetti"),
("Cheese", 1, "Burger");

insert  into `menu_item`(`dish_name` ,`dish_type` ,`description`) values 
("Tacos", "Tacos", "Tacos with beef"),
("Spagetti", "Spagetti", "Spagetti with a milk sauce"),
("Burger", "Burger", "Burger with cheese");

insert  into `mastered_dish`(`dish_name`) values 
("Tacos"),
("Spagetti");

insert  into `mentorship`(`studentID` , `sous_teacher`, `dish_name`, `start_date`, `end_date`) values 
(2, 7, "Tacos", 01/01/2013, 05/14/2013),
(2, 8, "Spagetti", 04/06/2018, 07/02/2019),
(8, 9, "Spagetti", 07/13/2012, 09/12/2012);

insert  into `sous_chef_dish`(`empID`, `dish_name`) values 
(2, "Tacos"),
(8, "Spagetti");

insert  into `part_time`(`empID`, `wage`) values 
(3, 25689),
(5, 12347),
(11, 12589),
(12, 11895);

insert  into `wait_staff`(`sectionID`, `empID`) values 
(2, 3),
(1, 11);

insert  into `dish_washer`(`empID`) values 
(5);

insert  into `maitre_d`(`empID`) values 
(12);

insert  into `meat`(`meat_name`) values 
("Beef"),
("Chicken"),
("Pork");

insert  into `spice_rating`(`rating_name`) values 
("Mild"),
("Hot"),
("Very Hot");

insert  into `menu`(`menu_type`, `dish_name`, `start_time`, `end_time`) values 
("Breakfast", "Burger", "08:00:00", "10:59:59"),
("Lunch", "Tacos", "11:00:00", "15:59:59"),
("Dinner", "Spagetti", "16:00:00", "07:59:59");


insert  into `buffet_menu`(`menu_type`, `price_for_buffet`) values 
("Breakfast", 9.99),
("Lunch", 11.99),
("Dinner", 19.99);

insert  into `kids_menu`(`menu_type`, `price_to_color`, `age`) values 
("Lunch", 2.99, 10),
("Dinner", 3.99, 10);

insert  into `menu_to_item`(`menu_type`, `dish_name`, `meat_name`, `rating_name`, `price`) values 
("Breakfast", "Burger", "Beef", "Hot", 8.99),
("Lunch", "Tacos", "Beef", "Very Hot", "12.99"),
("Dinner", "Spagetti", "Chicken", "Mild", "14.99");

insert  into `customer`(`customer_name`, `payment_name`, `customer_email`, `current_balance`, `street_name_number`, `zipcode`, `account_number`) values 
("John Smith", "Credit Card", "john_smith@gmail.com", 25.45, "123 Main St.", 12345, 1234567890),
("James Harden", "Cash", "abcdef@gmail.com", 54.35, "763 1st St.", 54374, 73575678973);


insert  into `orders`(`customer_name`, `date_ordered`, `time_ordered`, `comments`, `total`) values 
("John Smith", "2019-03-04", "20:45:34", "Delicious meal", 123.67),
("James Harden", "2018-10-31", "21:08:31", "Good taste", 231.43);


