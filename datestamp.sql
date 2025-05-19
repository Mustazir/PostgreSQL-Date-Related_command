-- Active: 1747497598035@@127.0.0.1@5432@test_database


SHOW timezone; -- Which Timezone is set currently?
/*
output:

TimeZone | Asia/Dhaka

*/

---Timestamp :date,Time,Timezone Combined Format. EX :2023-09-13 10:59:58.035+06---

SELECT now();

/*
output:

now |2025-05-19 13:12:19.780626+06

*/



---Timestamp with Timezone, and Timestamp without Timezone---

---for that at first we need to create a table with timestamp and timestamp with timezone data types.
CREATE TABLE test_table (
    ts timestamp without time zone,
    tsz timestamp with time zone
);

--Insert some data into the table
INSERT INTO test_table VALUES
('2023-09-13 10:59:00', '2023-09-13 10:59:58'),
('2023-09-13 08:09:00', '2023-09-13 10:59:58');

SELECT * FROM test_table;

/*
output:
ts  |	2023-09-13 10:59:00
tsz |	2023-09-13 10:59:58+06

*/

---Date Casting--- : From timestemp cast or return only date or time or both.

SELECT now()::date; -- return only date
/*
output:
now |	2025-05-19
*/
SELECT now()::time; -- return only time
/*
output:
now |	13:12:19.780626
*/
SELECT now()::timestamp; -- return both date and time
/* output:
now |	2025-05-19 13:12:19.780626
*/

---Date Formatting--- : Format the date in a specific format using to_char function.
SELECT to_char(now(), 'YYYY-MM-DD'); -- return date in YYYY-MM-DD format
/* output:
now |	2025-05-19
*/

---!More  Detailed in postgres to_char function documentation in google search.---


---Date Intervval---: Current date to previous date or next date.

/*
 here if we need befor date we can use ( - ) sign and if we need after date we can use  ( + ) sign.
 also we mention what interval we need like day, month, year, hour, minute, second etc.

*/
SELECT now() - interval '1 day'; -- return date 1 day before current date
/* output:
now |	2025-05-18
*/
SELECT now() + interval '1 day'; -- return date 1 day after current date
/* output:
now |	2025-05-20
*/
SELECT now() - interval '1 month'; -- return date 1 month before current date
/* output:
now |	2025-04-19
*/
SELECT now() - interval '1 year'; -- return date 1 year befor current date
/* output:
now |	2024-05-19
*/

---Date Difference---: Difference between two dates.or age calculation.

SELECT age(CURRENT_DATE,'2000-11-07'); -- return age from 2000-11-07 to current date

/* output:
age |   {"years":24,"months":6,"days":12}age
*/

-- Using database table we can calculate age from birthdate.For that at first we need to create a table with birthdate data type.
create Table student (
    name varchar(50),
    birthdate date,email varchar(50)
);

INSERT INTO student VALUES
('John Doe', '2000-11-07','johndoe@gmail.com'),
('Jane Doe', '1995-05-10','janedoe@gmail.com');

SELECT *,age(CURRENT_DATE,birthdate) as age FROM student;
/*
output:
name     | birthdate  | email             | age
---------+------------+-------------------+--------------------
John Doe | 2000-11-07 | johndoe@gmail.com | {"years":24,"months":6,"days":12}
Jane Doe | 1995-05-10 | janedoe@gmail.com | {"years":29,"months":11,"days":24}
*/


---Date Extract:-- Extract specific part of the date like year, month, day, hour, minute, second etc.
SELECT extract(year from CURRENT_DATE); -- return current year
/* output:
extract | 2025
*/
SELECT extract(month from CURRENT_DATE); -- return current month
/* output:
extract | 5
*/
SELECT extract(day from CURRENT_DATE); -- return current day
/* output:
extract | 19
*/
SELECT extract(hour from CURRENT_TIME); -- return current hour
/* output:
extract | 13
*/



