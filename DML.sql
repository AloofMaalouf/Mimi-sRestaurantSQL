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

insert  into `dine_in` (`seatID`, `tableID`, `sectionID`) values 
(1, 11, 1),
(2, 11, 1),
(4, 12, 2),
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
("Soup Station"),
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
(1, "Orange Chicken"),
(1, "Chow Mein"),
(1, "Wonton");

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
("Chicken", 1, "Orange Chicken"),
("Noodles", 1, "Chow Mein"),
("Broth", 1, "Wonton");

insert  into `menu_item`(`dish_name` ,`dish_type` ,`description`) values 
("Tacos", "Tacos", "Tacos with beef"),
("Spagetti", "Spagetti", "Spagetti with a milk sauce"),
("Burger", "Burger", "Burger with cheese"),
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
(7, 9, "Wonton", '2012-09-12', '2012-11-15');

insert  into `sous_chef_dish`(`empID`, `dish_name`) values 
(7, "Tacos"),
(8, "Spagetti"),
(9, "Wonton");

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
("Pork"),
("N/a");

insert  into `spice_rating`(`rating_name`) values 
("Mild"),
("Tangy"),
("Piquant"),
("Hot"),
("Oh My God");


insert  into `menu`(`menu_type`, `start_time`, `end_time`) values 
("Breakfast", '08:00:00', '10:59:59'),
("Lunch", '11:00:00', '15:59:59'),
("Dinner", '16:00:00', '07:59:59');



insert  into `buffet_menu`(`menu_type`, `price_for_buffet`) values 
("Breakfast", 9.99),
("Lunch", 11.99),
("Dinner", 19.99);


insert  into `kids_menu`(`menu_type`, `price_to_color`, `age`) values 
("Lunch", "Fluffy Bunny", 10),
("Dinner", "Juicy Cow", 10);


insert  into `menu_to_item`(`menu_type`, `dish_name`, `meat_name`, `rating_name`, `price`) values 
("Breakfast", "Burger", "Beef", "Hot", 8.99),
("Breakfast", "Wonton", "N/A", "Hot", 9.99),
("Lunch", "Tacos", "Beef", "Oh My God", 12.99),
("Lunch", "Orange Chicken", "Chicken", "Mild", 8.99),
("Dinner", "Spagetti", "Chicken", "Mild", 14.99),
("Dinner", "Chow Mein", "N/A", "Mild", 7.99);



insert  into `customer`(`customer_name`, `payment_name`, `customer_email`, `current_balance`, `street_name_number`, `zipcode`, `account_number`) values 
("James Harden", "Cash", "jamesH@gmail.com", 54.35, "763 1st St.", 54374, "73575678973"),
("Sum Dude", "Debit Card", "sum_dude@gmail.com", 0, "11601 Some Street", 23456, "5648942134"),
("Big Spender", "Miming Money", "bigspndr@gmail.com", 37.65, "283 Elm St.", 16519, "3215648974"),
("Clayton Kershaw", "Credit Card", "clytnkersh@gmail.com", 0, "5161 Garfield Ave", 51574, "3546512678"),
("Pedro Biaz", "Cash", "pedro_biaz@gmail.com", 0, "65161 Paramount Blvd", 54344, "9876235148"),
("Peggy Sue", "Cash", "peggy_sue@gmail.com", 0, "21 Jump Street", 44374, "6542341812"),
("Mel Gibson", "Credit Card", "gibson@gmail.com", 16.43, "3654 Gardenia Cir", 56481, "8523456945"),
("Sandra Kelvosowich", "Cash", "SandraK@gmail.com", 57.64, "8632 Portola Dr", 33452, "6452318456"),
("Taylor Swift", "Cash", "Taytay@gmail.com", 0, "4521 California St", 45612, "5166312548"),
("John Smith", "Debit Card", "SmthndWs@gmail.com", 350.12, "7412 Mashard Dr", 77851, "1234567894");


insert  into `orders`(`orderID`, `customer_name`, `date_ordered`, `time_ordered`, payment_name, `comments`, `total`) values 
(0000, "John Smith", '2019-03-04', '20:45:34', "Debit Card", "Delicious meal", 123.67),
(0001, "Sum Dude", '2020-03-15', '12:16:13', "Debit Card",  "Stupendous meal", 133.13),
(0002, "Big Spender", '2019-06-11', '13:27:33', "Cash",  "Awesome meal", 1000.00),
(0003, "Clayton Kershaw", '2019-07-30', '14:28:32', "Credit Card",  "Great meal", 1314.14),
(0004, "Pedro Biaz", '2020-01-02', '15:29:31', "Credit Card",  "Outstanding meal", 20.15),
(0005, "Peggy Sue", '2020-02-28', '16:30:39', "Cash",  "Disgusting meal", 13.06),
(0006, "Big Spender", '2019-06-10', '17:31:38', "Debit Card",  "Best ever meal", 333.07),
(0007, "John Smith", '2019-09-11', '18:32:37', "Debit Card",  "Deliciouso meal", 321.08),
(0008, "Big Spender", '2020-05-01', '20:33:36', "Miming Money",  "Free meal", 100),
(0009, "James Harden", '2018-10-31', '21:08:31', "Cash", "Good taste", 231.43),
(0010, "Taylor Swift", '2019-11-25', '18:35:41', "Cash", "Delicious", 32.76),
(0011, "Taylor Swift", '2019-11-26', '15:13:10', "Credit Card", "Delicious again", 35.69);


insert into `to_go` (`orderID`, `customer_name`, `time_ready`, `payment_method`, `time_picked_up`) values
(0004, "Pedro Biaz", '18:51:15', "Credit Card", '18:52:53'),
(0001, "Sum Dude", '16:26:32', "Cash", '16:27:05'),
(0003, "Clayton Kershaw", '15:37:22', "Credit Card", '15:37:52'),
(0008, "Big Spender", '13:52:42', "3215648974", '13:55:46'),
(0007, "John Smith", '18:47:12', "6512589143", '18:48:32'),
(0010, "Taylor Swift", '14:50:23', "6481233459", '14:54:21'),
(0011, "Taylor Swift", '15:45:32', "6481233459", '15:50:10');


insert into `phone_order` (`orderID`, `customer_name`, `phone_number`) values
(0008, "Big Spender", "3215648974"),
(0011, "Taylor Swift", "5166312548");



insert into `online_order` (`orderID`, `customer_name`, `card_credentials`) values
(0003, "Clayton Kershaw", "1475648512345987"),
(0001, "Sum Dude", "8521964857153225");


insert into `mimi_business` (`customer_name`, `corporation_name`, `department`, `contact_phone`) values
("Mel Gibson", "Gibson and Son's", "CEO", "8523456945"),
("Sandra Kelvosowich", "Microsoft", "Sales Manager", "6452318456"),
("John Smith", "Smith n Wesson", "T&D", "1234567894");

---
insert into `payment` (`payment_name`) values
("Credit Card"),
("Cash"),
("Miming Money"),
("Debit Card");


insert into `party` (`party_leader`, `size`) values
("Taylor Swift", 5),
("Mel Gibson", 4),
("Sandra Kelvosowich", 7);


insert into `party_table` (`party_leader`, `tableID`) values
("Taylor Swift", 11),
("Mel Gibson", 12),
("Sandra Kelvosowich", 21);


insert into `shift` (`shift_date`, `start`, `end`) values
('2020-05-08', '08:00:00', '12:00:00'),
('2020-05-08', '12:00:00', '20:00:00'),
('2020-05-09', '08:00:00', '16:00:00'),
('2020-05-09', '16:00:00', '20:00:00'),
('2020-05-10', '08:00:00', '14:00:00'),
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
("Taylor Swift", "Tacos"),
("Taylor Swift", "Spagetti"),
("John Smith", "Burger"),
("James Harden", "Tacos"),
("Pedro Biaz", "Orange Chicken"),
("Sum Dude", "Chow Mein"),
("Clayton Kershaw", "Wonton");
