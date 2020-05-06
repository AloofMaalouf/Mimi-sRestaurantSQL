insert into payment(payment_name) values
('Credit Card'),
('Cash'),
('Miming Money'),
('Debit Card');

insert  into section(sectionID,numTables, maxPpl) values 
(1, 2, 4),
(2, 2, 8);

insert  into `Table` (tableID, sectionID ,capacity) values 
(11, 1, 2),
(12, 1, 2),
(21, 2, 4),
(22, 2, 4);

insert  into seat(seatID, tableID ,positionNum) values 
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

insert  into dine_in(seatID ,tableID) values 
(1, 11),
(2, 11),
(4, 12),
(7, 21);

insert  into employee(empID , fname , lname, phone) values 
(1, 'George', 'Washington', '1234567890'),
(2, 'Abraham', 'Lincoln', '2324543685'),
(3, 'John', 'Kennedy', '3426894596'),
(4, 'Franklin', 'Roosevelt', '2359543679'),
(5, 'Ronald', 'Reagan', '4355068036'),
(6, 'Jorge', 'Bush', '2334859276'),
(7, 'Barack', 'Obama', '3048502845'),
(8, 'David', 'Brown', '9234576453'),
(9, 'LeBron', 'James', '9234676453'),
(10, 'Michael', 'Jordan', '9234846453'),
(11, 'Kobe', 'Bryant', '6572846453'),
(12, 'Kevin', 'Durant', '7878746473');

insert  into full_time(empID, payrate) values 
(1, 23000),
(2, 32500),
(4, 54000),
(6, 34000),
(7, 34500),
(8, 32500),
(9, 54000),
(10, 34000);

insert  into manager(empID) values 
(4);

insert  into chef(empID) values 
(1),
(2),
(6),
(7),
(8),
(9),
(10);

insert  into line_cook(empID) values 
(6);

insert  into sous_chef(empID) values 
(2),
(7),
(8),
(9),
(10);

insert  into cook_station (station_name) values 
('Salad Station'),
('Soup Station'),
('Entree Station');

insert  into station_assignment(station_name, empID) values 
('Salad Station', 6),
('Soup Station', 6),
('Entree Station', 6);

insert  into head_chef(empID) values 
(1);

insert  into recipe(empID, dish_name) values 
(1, 'Spagetti'),
(1, 'Burger'),
(1, 'Tacos');

insert  into ingredient(ingredient) values 
('Lettuce'),
('Milk'),
('Cheese'),
('Noodles'),
('Tomatoes');

insert  into dish(ingredient, dish_name) values 
('Lettuce', 'Tacos'),
('Milk', 'Spagetti'),
('Cheese', 'Burger');

insert  into menu_item(dish_name , dish_type , description) values 
('Tacos', 'Entree', 'Tacos with beef'),
('Spagetti', 'Entree', 'Spagetti with a milk sauce'),
('Burger', 'Entree', 'Burger with cheese');
insert  into mastered_dish(dish_name) values 
('Tacos'),
('Spagetti'),
('Burger');

insert  into mentorship(studentID , sous_teacher, dish_name, start_date, end_date) values 
(2, 7, 'Tacos', '2013-01-01', '2013-05-14'),
(2, 8, 'Spagetti', '2018-04-06', '2019-07-02'),
(8, 9, 'Spagetti', '2012-07-13', '2012-09-12');

insert  into sous_chef_dish(empID, dish_name) values 
(7, 'Tacos'),
(7, 'Burger'),
(7, 'Spagetti'),
(9, 'Spagetti'),
(2, 'Tacos'),
(2, 'Burger'),
(2, 'Spagetti'),
(8, 'Spagetti');

insert  into part_time(empID, wage) values 
(3, 25689),
(5, 12347),
(11, 12589),
(12, 11895);

insert  into wait_staff(sectionID, empID) values 
(2, 3),
(1, 11);

insert  into dish_washer(empID) values 
(5);

insert  into maitre_d(empID) values 
(12);

insert  into meat(meat_name) values 
('Beef'),
('Chicken'),
('Pork');

insert  into spice_rating(rating_name) values 
('Mild'),
('Tangy'),
('Piquant'),
('Hot'),
('Oh My God');

insert  into menu(menu_type, start_time, end_time) values 
('Breakfast', '08:00:00', '10:59:59'),
('Lunch', '11:00:00', '15:59:59'),
('Dinner', '16:00:00', '07:59:59');

insert  into buffet_menu(menu_type, price_for_buffet) values 
('Breakfast', 9.99),
('Lunch', 11.99),
('Dinner', 19.99);

insert  into kids_menu(menu_type, pic_to_color, age) values 
('Lunch', 'Fluffy Bunny', 10),
('Dinner', 'Juicy Cow', 10);

insert  into menu_to_item(menu_type, dish_name, meat_name, rating_name, price) values 
('Breakfast', 'Burger', 'Beef', 'Hot', 8.99),
('Lunch', 'Tacos', 'Beef', 'Piquant', 12.99),
('Dinner', 'Spagetti', 'Chicken', 'Mild', 14.99);

insert  into customer(customer_name, customer_email, current_balance, street_name_number, zipcode, account_number) values 
('John Smith', 'john_smith@gmail.com', 0, '123 Main St.', 12345, '1234567890'),
('James Harden', 'abcdef@gmail.com', 23, '763 1st St.', 54374, '73575678973'),
('Sum Dude', 'abcdef@gmail.com', 0, '11601 Some Street', 23456, '5648942134'),
('Big Spender', 'abcdef@gmail.com', 0, '283 Elm St.', 16519, '3215648974'),
('Clayton Kershaw', 'abcdef@gmail.com', 0, '5161 Garfield Ave', 51574, '3546512678'),
('Pedro Biaz', 'abcdef@gmail.com', 0, '65161 Paramount Blvd', 54344, '9876235148'),
('Peggy Sue', 'abcdef@gmail.com', 1, '21 Jump Street', 44374, '6542341812')
;
 
insert  into `order` (customer_name, date_ordered, time_ordered, payment_name, comments, total) values 
('John Smith', '2020-03-04', '11:55:30', 'Debit Card',  'Delicious meal', 74.12),
('Sum Dude', '2020-03-15', '12:16:13', 'Debit Card',  'Stupendous meal', 133.13),
('Big Spender', '2019-06-11', '13:27:33', 'Cash',  'Awesome meal', 1000.00),
('Clayton Kershaw', '2019-07-30', '14:28:32', 'Credit Card',  'Great meal', 1314.14),
('Pedro Biaz', '2020-01-02', '15:29:31', 'Credit Card',  'Outstanding meal', 20.15),
('Peggy Sue', '2020-02-28', '16:30:39', 'Cash',  'Disgusting meal', 13.06),
('Big Spender', '2019-06-10', '17:31:38', 'Debit Card',  'Best ever meal', 333.07),
('John Smith', '2019-09-11', '18:32:37', 'Debit Card',  'Deliciouso meal', 321.08),
('Big Spender', '2020-05-01', '20:33:36', 'Miming Money',  'Free meal', 100),
('James Harden', '2019-10-31', '21:08:31', 'Cash', 'Good taste', 230.13);

insert into mimi_business(customer_name, corporation_name, department, contact_phone) values
('John Smith', 'Smith n Wesson', 'T&D', 1234567894);

insert into `shift`(`shift_date`, `start`, `end`) values
('2020-03-04', '8:00:00', '12:00:00'),
('2020-03-04', '12:00:00', '17:00:00'),
('2020-03-04', '17:00:00', '21:00:00');

insert into `scheduled_shift`(`empID`, `shift_date`, `start`, `end`) values
(12, '2020-03-04', '8:00:00', '12:00:00'),
(12, '2020-03-04', '12:00:00', '17:00:00'),
(12, '2020-03-04', '17:00:00', '21:00:00'),
(1, '2020-03-04', '8:00:00', '12:00:00'),
(3, '2020-03-04', '12:00:00', '17:00:00'),
(2, '2020-03-04', '17:00:00', '21:00:00'),
(7, '2020-03-04', '17:00:00', '21:00:00');

 insert  into `bill_item`(`customer_name`, `date_ordered`, `time_ordered`, `dish_name`) values
("Big Spender", '2019-06-10', '17:31:38', "Burger"),
('John Smith', '2020-03-04', '11:55:30', "Burger"),
('Sum Dude', '2020-03-15', '12:16:13', "Burger"),
('Clayton Kershaw', '2019-07-30', '14:28:32', "Burger"),
('Pedro Biaz', '2020-01-02', '15:29:31', "Spagetti"),
('Peggy Sue', '2020-02-28', '16:30:39', "Tacos");
