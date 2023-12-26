-- Question: Which countries have the highest invoices? List the top 5
SELECT billing_country, count(invoice_id)
FROM invoice
GROUP BY billing_country
ORDER BY count(invoice_id) DESC;
-- Answer: USA (131), Canada (76), Brazil (61), France (50), Germany (41)

-- Question: What are the highest totals within the invoice table? List the top 5
SELECT total FROM invoice
ORDER BY total DESC
LIMIT 5;
-- Answer: Highest totals are 23.76 then the next 4 19.8

-- Question: Who is the best city? Return the city 
-- with the highest sum of invoice totals
-- List both city name and sum of totals
SELECT c.first_name, c.last_name, c.city, SUM(i.total) AS invoice_total
FROM customer c 
INNER JOIN invoice i 
ON i.customer_id=c.customer_id
GROUP BY city
ORDER BY SUM(total) DESC;
-- Answer: Highest customer cities are Prague (273.2), 
-- Mountain View (169.3), London (166.3), Berlin (158.4), Paris (151.5)

-- Who is the best customer? Return first, last name and total spent
SELECT c.first_name. c.last_name, SUM(i.total) as invoice_total
FROM customer c 
INNER JOIN invoice i 
on i.customer_id=c.customer_id
GROUP BY 1,2 
ORDER BY SUM(total) DESC;
-- Answer: Frantisek Wichterlova is our top customer 
-- with an invoice_total of 144.5

-- Question: What was the total spent per customer on the best selling artist?
-- Return artist name, also the total spent
WITH best_artist AS(
    SELECT artist.artist_id, artist.name as artist_name, 
    SUM(invoice_line.unit_price * invoice_line.quantity) as total_sales
    FROM invoice_line
    JOIN track on invoice_line.track_id=track.track_id
    JOIN album on track.album_id=album.album_id
    JOIN artist on album.artist_id=artist.artist_id
        GROUP BY 1
    ORDER BY total_sales DESC
);
SELECT * FROM best_artist;
-- Answer: Queen is our best seller, average spent per customer is 190.1

-- Question: Return all information regarding 
-- all music listeners of a given genre. Let's do R&B and Soul
SELECT DISTINCT first_name, last_name, email
FROM customer c 
JOIN invoice i ON c.customer_id=i.customer_id
JOIN invoice_line il ON i.invoice_id=il.invoice_id
WHERE track_id IN(
    SELECT track_id FROM track t 
    JOIN genre g on t.genre_id=g.genre_id
    WHERE g.name LIKE 'R&B/Soul'
)
ORDER BY email; 
-- Returns list of customers from R&B/Soul genre. 
-- Returned them alphabetical. 

-- Question: Return artist and total track count of top 10 R&B/Soul
SELECT artist.name, artist.artist_id, COUNT(artist.artist_id) AS total_no_songs
FROM artist
JOIN album on artist.artist_id=album.artist_id
JOIN track on album.album_id= track.album_id
JOIN genre on track.genre_id=genre.genre_id
WHERE genre.name LIKE 'R&B/Soul'
GROUP BY artist.name, artist.artist_id
ORDER BY total_no_songs DESC;
-- Answer: James Brown (20), Marvin Gaye (18), Amy Winehouse (17),
-- Jamiroquai (11) 

-- Question: What is the most popular genre per country?
WITH popular_genre AS (
    SELECT
        COUNT(invoice_line.quantity) AS purchases,
        customer.country,
        genre.name,
        genre.genre_id,
        ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS row_no
    FROM
        invoice_line
        JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
        JOIN customer ON invoice.customer_id = customer.customer_id
        JOIN track ON track.track_id = invoice_line.track_id
        JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY 2, 3, 4
    ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE row_no <= 1;
-- GROUP BY 2,3,4 indicates 
-- grouping by the respective columns in the SELECT clause
-- Similar for ORDER BY which orders by ASC country, DESC count
-- Answer: Rock is the top genre for all countries in the database 
-- except Argentina. Argentina prefers Alternative & Punk

-- Question: Given all that we know, return the top customer per country.
-- If there are multiple customers with the same amount spent, return all
WITH RECURSIVE 
  customer_country AS(
      SELECT 
        c.customer_id,
        c.first_name, 
        c.last_name, 
        i.billing_Country, 
        SUM(total) AS total_spending
      FROM 
        customer c
        JOIN invoice i ON c.customer_id = i.customer_id
      GROUP BY 1,2,3,4
      ORDER BY 1,5 DESC),
	  
  country_max_spend AS(
      SELECT billing_country, 
      MAX(total_spending) AS max_spending
	  FROM 
        customer_country
	  GROUP BY 1)

SELECT 
    cc.billing_country, 
    cc.total_spending, 
    cc.first_name, 
    cc.last_name,
    cc.customer_id
FROM 
    customer_country cc
    JOIN country_max_spend cm
ON cc.billing_country = cm.billing_country;
-- Returns top customers per country
