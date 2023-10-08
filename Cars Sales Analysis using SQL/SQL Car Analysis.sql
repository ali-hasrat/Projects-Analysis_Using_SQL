-- Problem Statement: Steve runs a top-end car showroom but his data analyst has just quit and left him without his crucial insights.
-- Solution: I have analyze the data and provide a proper solution for the given problem statement.
             
			 -- By Hasrat Ali
			 
-- Q1. What are the details of all cars purchased in the year 2022?
      
SELECT DISTINCT(C.car_id), C.make, C.type, C.style, C.cost_$
FROM sales S 
JOIN cars C USING (car_id)
WHERE EXTRACT(YEAR FROM purchase_date) = '2022'
ORDER BY car_id;

-- Q2. What is the total number of cars sold by each salesperson?

SELECT salesman_id, SP.name, COUNT(S.sale_id) AS "No. of Cars Sold"
FROM sales S 
JOIN salespersons SP USING (salesman_id)
GROUP BY salesman_id

-- Q3. What is the total revenue generated by each salesperson?

SELECT salesman_id, SP.name AS "Name of the Salesperson", SUM(C.cost_$) AS "Total Revenue Generated (in USD)"
FROM sales S 
JOIN salespersons SP USING (salesman_id)
JOIN cars C USING (car_id)
GROUP BY salesman_id

-- Q4. What are the details of the cars sold by each salesperson?

SELECT DISTINCT salesman_id, SP.name AS "Name of the Salesperson", C.car_id, C.make, C.type, C.style, C.cost_$
FROM sales S 
JOIN salespersons SP USING (salesman_id)
JOIN cars C USING (car_id)
ORDER BY salesman_id, car_id

-- Q5. What is the total revenue generated by each car type?

SELECT C.car_id, C.make, C.type, C.style, SUM(C.cost_$) AS "Total Revenue Generated"
FROM sales S 
JOIN cars C USING (car_id)
GROUP BY car_id

-- Q6. What are the details of the cars sold in the year 2021 by salesperson ‘Emily Wong’?

SELECT C.car_id, C.make, C.type, C.style, C.cost_$
FROM sales S 
JOIN cars C USING (car_id)
JOIN salespersons SP USING (salesman_id)
WHERE EXTRACT(YEAR FROM purchase_date) = '2021' AND SP.name = "Emily Wong"
ORDER BY C.car_id

Q7. What is the total revenue generated by the sales of hatchback cars?

SELECT C.car_id, C.make, C.type, C.style, SUM(C.cost_$) AS "Total Revenue Generated"
FROM sales S 
JOIN cars C USING (car_id)
WHERE C.style = "Hatchback"
GROUP BY C.car_id

-- Q8. What is the total revenue generated by the sales of SUV cars in the year 2022?

SELECT C.style, EXTRACT(YEAR FROM S.purchase_date) AS "Purchased Year", SUM(C.cost_$) AS "Total Revenue Generated"
FROM sales S 
JOIN cars C USING (car_id)
WHERE C.style = 'SUV' AND EXTRACT(YEAR FROM S.purchase_date) = 2022
GROUP BY C.style, EXTRACT(YEAR FROM S.purchase_date);

-- Q9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?

SELECT SP.salesman_id, SP.name, SP.city
FROM sales S 
JOIN salespersons SP USING (salesman_id)
WHERE EXTRACT(YEAR FROM S.purchase_date) = "2023"
GROUP BY salesman_id
ORDER BY COUNT(S.sale_id) DESC
LIMIT 1

-- Q10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?

SELECT SP.salesman_id, SP.name, SP.age
FROM sales S 
JOIN cars C USING (car_id)
JOIN salespersons SP USING (salesman_id)
WHERE EXTRACT(YEAR FROM S.purchase_date) = "2022"
GROUP BY salesman_id
ORDER BY SUM(C.cost_$) DESC
LIMIT 1

               ---- Thank You! ----