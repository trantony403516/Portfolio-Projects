/*
The general manager is looking to increase membership fees based on each facilities monthly maintenance cost and monthly bookings. 
The manager also wants to provide certain staff with a pay raise. In addition to providing certain members with a 
promotional deal based of the amount of business that customer has brought in. 
*/

--Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2
SELECT customer_id,SUM(amount)FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

--Provide a list of facilities that charge a fee to members, and that fee is less than 1/50th of the facilities' monthly maintenance cost
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost > 0 AND (membercost < monthlymaintenance/50.0);


--Provide a list of members who joined after the start of September 2012
SELECT memid, surname, firstname, joindate FROM cd.members 
WHERE joindate >= '2012-09-01';


--Provide the name of the most recently member who joined who joined our facility 
SELECT MAX(joindate) AS latest_signup FROM cd.members;


--Provide a list of the total number of slots booked per facility in the month of September 2012
SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' 
GROUP BY facid 
ORDER BY SUM(slots);


--Provide a list of facilities with more than 1000 slots booked
SELECT facid, sum(slots) AS total_slots FROM cd.bookings 
GROUP BY facid HAVING SUM(slots) > 1000 
ORDER BY facid;


--Provide a list of the start times for bookings for tennis courts, for the date '2012-09-21'
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;


--Provide a list of the start times for bookings by members named 'David Farrell'?
SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members 
ON cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';

