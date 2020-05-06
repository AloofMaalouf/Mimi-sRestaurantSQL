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
(1, "Tacos"),
(2, "Orange Chicken"),
(2, "Chow Mein"),
(2, "Wonton");

insert  into `ingredient`(`ingredient`) values 
("Beef"),
("Milk"),
("Cheese"),
("Noodles"),
("Tomatoes"),
("Chicken"),
("Broth");

insert  into `dish`(`ingredient`, `empID`, `dish_name`) values 
("Beef", 1, "Tacos"),
("Milk", 1, "Spagetti"),
("Cheese", 1, "Burger"),
("Chicken", 2, "Orange Chicken"),
("Noodles", 2, "Chow Mein"),
("Broth", 2, "Wonton");

insert  into `menu_item`(`dish_name` ,`dish_type` ,`description`) values 
("Tacos", "Tacos", "Tacos with beef"),
("Spagetti", "Spagetti", "Spagetti with a milk sauce"),
("Burger", "Burger", "Burger with cheese");
("Orange Chicken", "Orange Chicken", "Traditional Chinese Orange Chicken"),
("Chow Mein", "Chow Mein", "Stir Fried Noodles with vegetables"),
("Wonton", "Wonton", "Dumplings with minced pork in a soup");

insert  into `mastered_dish`(`dish_name`) values 
("Tacos"),
("Spagetti"),
("Wonton");

insert  into `mentorship`(`studentID` , `sous_teacher`, `dish_name`, `start_date`, `end_date`) values 
(2, 7, "Tacos", '2013-01-01', '2013-05-14'),
(2, 8, "Spagetti", '2018-04-06', '2019-07-02'),
(8, 9, "Spagetti", '2012-07-13', '2012-12-09'),
(6, 9, "Wonton", '2012-09-12', '2012-11-15');

insert  into `sous_chef_dish`(`empID`, `dish_name`) values 
(2, "Tacos"),
(8, "Spagetti"),
(6, "Wonton"),

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
("Breakfast", "Burger", '08:00:00', '10:59:59'),
("Breakfast", "Wonton", '08:00:00', '10:59:59'),
("Lunch", "Tacos", '11:00:00', '15:59:59'),
("Lunch", "Orange Chicken", '11:00:00', '15:59:59'),
("Dinner", "Spagetti", '16:00:00', '07:59:59'),
("Dinner", "Chow Mein", '16:00:00', '07:59:59');

insert  into `buffet_menu`(`menu_type`, `price_for_buffet`) values 
("Breakfast", 9.99),
("Lunch", 11.99),
("Dinner", 19.99);

insert  into `kids_menu`(`menu_type`, `price_to_color`, `age`) values 
("Lunch", 2.99, 10),
("Dinner", 3.99, 10);

insert  into `menu_to_item`(`menu_type`, `dish_name`, `meat_name`, `rating_name`, `price`) values 
("Breakfast", "Burger", "Beef", "Hot", 8.99),
("Breakfast", "Wonton", "Broth", "Hot", 9.99),
("Lunch", "Tacos", "Beef", "Very Hot", 12.99),
("Lunch", "Orange Chicken", "Chicken", "Mild", 8.99),
("Dinner", "Spagetti", "Chicken", "Mild", 14.99),
("Dinner", "Chow Mein", "Noodles", "Mild", 7.99);

insert  into `customer`(`customer_name`, `payment_name`, `customer_email`, `current_balance`, `street_name_number`, `zipcode`, `account_number`) values 
("John Smith", "Credit Card", "john_smith@gmail.com", 25.45, "123 Main St.", 12345, 1234567890),
("James Harden", "Cash", "abcdef@gmail.com", 54.35, "763 1st St.", 54374, 73575678973);


insert  into `orders`(`customer_name`, `date_ordered`, `time_ordered`, `comments`, `total`) values 
("John Smith", '2019-03-04', "20:45:34", "Delicious meal", 123.67),
("James Harden", '2018-10-31', "21:08:31", "Good taste", 231.43);


insert into `to_go` (`customer_name`, `time_ready`. `payment_method`, `time_picked_up`) values
("Jerry Seinfeld", "18:51:15", "Credit Card", "18:52:53"),
("Bob Hope", "16:26:32", "Cash", "16:27:05"),
("Gwyneth Paltrow", "15:37:22", "Credit Card", "15:37:52");


insert into `phone_order` (`customer_name`, `phone_number`) values
("Stevie Wonder", "6512589143"),
("Taylor Swift", "6481233459");


insert into `online_order` (`customer_name`, `card_credentials`) values
("Adam Jensen", "1475648512345987"),
("Michael De Santa", "8521964857153225");


insert into `mimi_business` (`customer_name`, `corporation_name`, `department`, `contact_phone`) values
("Mel Gibson", "Gibson and Son's", "CEO", "8523456945"),
("Sandra Kelvosowich", "Microsoft", "Sales Manager", "6452318456");


insert into `payment` (`payment_name`) values
("Credit Card"),
("Cash"),
("Miming Money"),
("Debit Table");


insert into `party_table` (`party_leader`, `size`) values
("Kurt Russel", 5),
("Harold Houdini", 6),
("Betty White", 9);


insert into `shift` (`shift_date`, `start`, `end`) values
('2020-05-08', '08:00:00', '12:00:00'),
('2020-05-08', '12:00:00', '20:00:00'),
('2020-05-09', '12:00:00', '20:00:00'),
('2020-05-09', '16:00:00', '20:00:00'),
('2020-05-10', '08:00:00', '16:00:00'),
('2020-05-10', '14:00:00', '20:00:00'),
('2020-05-11', '08:00:00', '12:00:00'),
('2020-05-11', '12:00:00', '20:00:00'),
('2020-05-12', '08:00:00', '16:00:00'),
('2020-05-12', '16:00:00', '20:00:00');



insert into `scheduled_shift` (`empID`, `shift_date`, `start`, `end`) values
(1, '2020-05-08', '08:00:00', '12:00:00'),
(2, '2020-05-08', '12:00:00', '20:00:00'),
(3, '2020-05-09', '08:00:00', '16:00:00'),
(4, '2020-05-09', '16:00:00', '20:00:00'),
(5, '2020-05-10', '08:00:00', '14:00:00'),
(6, '2020-05-10', '14:00:00', '20:00:00'),
(7, '2020-05-11', '08:00:00', '12:00:00'),
(8, '2020-05-11', '12:00:00', '20:00:00'),
(9, '2020-05-12', '08:00:00', '16:00:00'),
(10, '2020-05-12', '16:00:00', '20:00:00');


insert into `bill_item` (`customer_name`, `dish_name`) values
(`Taylor Swift`, `Tacos`),
(`Stevie Wonder`, `Spagetti`),
(`John Smith`, `Burger`),
(`James Harden`, `Tacos`),
(`Jerry Seinfeld`, `Orange Chicken`),
(`Gwyneth Paltrow`, `Chow Mein`),
(`Bob Hope`, `Wonton`);


