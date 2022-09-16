-- first query
SELECT * FROM owners o --need to review what * means in this syntax
  FULL OUTER JOIN vehicles v --Full outer join adds this other DB (vehicles) to owners, with the space folloing, they are set to a variable (o and v)
    ON o.id=v.owner_id; --this sets the columns to match based on their data. might need to rewatch explaination later.

-- second query
SELECT first_name, last_name, --we are retrieving these columns
  COUNT(owner_id) FROM owners o --setting a COUNT(from selected column of DB) FROM owners DB set to variable "o"
  JOIN vehicles v on o.id=v.owner_id --then we are joining the db to vehicles referenced by "v" and assigning it to match with o
  GROUP BY (first_name, last_name) --does grouping mean if we are already selecting columns. will rewatch video
ORDER BY first_name; --sets the order in which the data is displayed 


-- third query
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, --looks like a method, might have missed explaination video covering these. calls rounding method which calls another method, AVG and you then select the data in the parameter. finally we are creating a column with the header "average_price"
  COUNT(owner_id) --count function for the owner_id data column
FROM owners o --from data reassigned as o
JOIN vehicles v on o.id=v.owner_id --join this data reassigned as v and set id from o and v to match
GROUP BY --not to sure just yet on group
  (first_name, last_name) 
HAVING --looks like a conditional
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 --where id greater than 1 average price exceeds 10000
ORDER BY first_name DESC;--feels like there is a lot of conflicting orders in this organization