/* 1 */
SELECT c.customer_name, c.customer_email, c.street_name_number, c.zipcode,
CASE
c.customer_name
   WHEN
c.customer_name IN (SELECT m.customer_name FROM mimi_business m 
        NATURAL
JOIN customer c WHERE m.customer_name = c.customer_name) THEN "Individual"
    ELSE
"Corporate"
END AS
customer_type
FROM
customer AS c;

/* 2 */
SELECT NAME, TOTAL from
(SELECT
customer.customer_name AS "NAME", SUM(`order`.total) AS "TOTAL"
FROM
customer INNER JOIN `order` on customer.customer_name = `order`.customer_name
GROUP BY
customer.customer_name
order by
TOTAL desc) descTot
limit 3;

 
/* 3 */
Select fname, lname, "Mastered Dishes Count", dish_name from EMPLOYEE
INNER JOIN
(SELECT
empid, count(dish_name) AS "Mastered Dishes Count" from 
sous_chef_dish
group by
empid
HAVING
count(dish_name) >= 3
) dishMaster
USING(EMPID)
INNER JOIN
SOUS_CHEF_DISH
USING(empid);
 
/* 4 */
select employee1.fname, employee1.lname, employee2.fname, employee2.lname, dish_name from
employee
employee1
inner join
(select
`EMP1 ID` AS `Employee 1`, `EMP2 ID` AS `Employee 2`, count(dish_name) as Dish
from
(select
emp1.empid AS `EMP1 ID`, emp2.empid AS `EMP2 ID`, emp1.dish_name from
(select
distinct empid, dish_name
    from
sous_chef_dish
    inner
join employee 
    using(empid))
emp1
inner join
(select
distinct empid, dish_name
    from
sous_chef_dish
    inner
join employee 
    using(empid))
emp2
USING(dish_name)
where
emp1.empid < emp2.empid) common
group by
`EMP1 ID`, `EMP2 ID`
having
count(dish_name) >= 3) someName
on
employee1.EMPID = someName.`Employee 1`
    inner
join employee employee2
        on
employee2.EMPID = someName.`Employee 2`
    inner
join
        sous_chef_dish
scd
        on
employee1.EMPID = scd.EMPID;
 

/* 5 Find the three menu items most often ordered from the Children`s menu 
and order them from most frequently ordered to least frequently ordered. */
 
 
/* 6 Show by week, how many hours each employee works. */
 
 
/* 7 */
Select customer_name, current_balance from customer 
order by
current_balance desc;

 
/* 8 */
Select customer_name, total from `order`
where
payment_name = "Miming Money";
 
 
/* 9 Report on the customers at Miming`s by the number of times that they come in by 
month and order the report from most frequent to the least frequent. Each row in 
the output should have the Customer name, the month, the year, and the number of 
times that customer came in during that month of that year. */
 
/* 10 */
SELECT customer.customer_name AS "NAME", SUM(`order`.total) AS "TOTAL", date_ordered as "order date"
FROM
customer INNER JOIN `order` on customer.customer_name = `order`.customer_name
where
`order`.date_ordered >  year(now()) -1 and  `order`.date_ordered
< NOW()
GROUP BY
customer.customer_name
order by
TOTAL desc
limit 3;
 
/* 11 List the five menu items that have generated the most revenue for Miming`s over the past year (365 days). */
 
/* 12 */
select fname, lname from employee
inner join
(select sous_teacher from mentorship
group by sous_teacher
having count(sous_teacher) =
(select max(`Teaching`) from
(select sous_teacher, count(sous_teacher) AS `Teaching` from mentorship
group by sous_teacher
order by count(sous_teacher)) teach)) teach2
on sous_teacher = empid;

/* 13 */
select dish_name, count(dish_name) AS "Dish Masters" from sous_chef_dish
group by dish_name
order by count(dish_name) asc
limit 3;
 
/* 14 */
select customer_name from customer
natural join mimi_business;


/* 15 */
select menu_type, price, dish_name
 from menu_to_item
order by menu_type;

/* 16 */

/*Demonstrates business rule 1 and 2 showing that each waitstaff employee has only 1 section
 and each section has at most 5 tables*/
select fname, lname, count(sectionID) as waitstaff_section_count, sectionID, count(tableID)
from employee natural join part_time natural join wait_staff natural join section natural join `Table`
where employee.empID = wait_staff.empID
group by fname, lname;

/*Demonstrates business rule 3 showing that each station has at most 2 line cooks*/
select station_name, count(empID)
from station_assignment
group by station_name;

/*Demonstrates business rule 4 showing that each line cook can have at most 3 stations assigned to them*/
select fname, lname, ifnull(count(station_name), 0) as station_count
from station_assignment 
left outer join line_cook on station_assignment.empID = line_cook.empID
left outer join full_time on line_cook.empID = full_time.empID 
left outer join employee on full_time.empID = employee.empID
where line_cook.empID = employee.empID
group by fname, lname;

/*Demonstrates business rule 5 showing that each shift has at least 1 maitre d*/
select count(scheduled_shift.empID) as maitre_d_count, shift_date, start, end
from scheduled_shift natural join employee natural join part_time natural join maitre_d
where scheduled_shift.empID = maitre_d.empID
group by shift_date, start, end;




