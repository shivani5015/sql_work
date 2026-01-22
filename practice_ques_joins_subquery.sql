use new;
select * from events;
select * from ticket_sales;
#Q1Find the total quantity sold per event_id. 
select event_id,sum(qty) from ticket_sales group by event_id;
#Q2Find the total revenue per event_id. 
select event_id , sum(price_per_ticket*qty) as total_revenue from ticket_sales group by event_id;
#Q3 Find monthly total revenue (group by month of sale_date). 
select month(sale_date) ,sum(price_per_ticket*qty) as total_revenue from ticket_sales group by month(sale_date);
#Q4Find the maximum price_per_ticket per event_id.
select event_id,max(price_per_ticket) from ticket_sales group by event_id;
#Q 5 Find total revenue per month and ticket_type.
select month(sale_date),ticket_type,sum(price_per_ticket*qty) from ticket_sales group by month(sale_date),ticket_type;
#Q6 List all sales with event_name and sale_date.
select sale_id  ,event_name ,sale_date from ticket_sales join events on ticket_sales.event_id=events.event_id;
#Q7Show event_name, ticket_type, qty for each sale. event_name ticket_type qty
select event_name , ticket_type ,qty from ticket_sales left join events on ticket_sales.event_id=events.event_id;
#Q8Show sales where the event city is Mumbai.
select sale_id,event_name,city,sale_date from ticket_sales join events on ticket_sales.event_id=events.event_id where city="mumbai";
#Q9 Show all events and matching sales
SELECT event_name, sale_id, sale_date FROM events LEFT JOIN ticket_sales ON ticket_sales.event_id = events.event_id;
#Q10 Show distinct event names that have at least one sale. 
select distinct(event_name)  from events join ticket_sales on ticket_sales.event_id = events.event_id;
#Q11 Show each sale’s computed revenue with event name. 
select sale_id,event_name,(price_per_ticket*qty) as revenue from ticket_sales left join events on ticket_sales.event_id = events.event_id;
#Q12 Find total quantity per event_name. event_name total_qty 
select event_name,sum(qty) from ticket_sales join events  on ticket_sales.event_id = events.event_id group by event_name;
#Q13 Find total VIP revenue per event_name. 
select event_name ,sum(price_per_ticket*qty)as total_vip_revenue from ticket_sales join events  on ticket_sales.event_id = events.event_id where ticket_type="vip" group by event_name;
#Q14 Find monthly revenue per city. city sale_month total_revenue
select city,month(sale_date),sum(price_per_ticket*qty) as monthly_revenue from ticket_sales join events on ticket_sales.event_id = events.event_id  group by city ,month(sale_date);
#Q15Find total quantity per city and ticket_type.
select city,ticket_type,sum(qty) from ticket_sales join events on ticket_sales.event_id = events.event_id group by city,ticket_type;
#Q16 Find sales that happened on the latest sale_date in the table.
SELECT * FROM ticket_sales WHERE sale_date = (SELECT MAX(sale_date) FROM ticket_sales);
#Q17 Find sales where revenue is greater than the overall average sale revenue. 
WITH SaleTotals AS (SELECT sale_id, event_id, (price_per_ticket * qty) AS revenue FROM ticket_sales) SELECT sale_id, event_id, revenue FROM SaleTotals WHERE revenue > (SELECT AVG(revenue) FROM SaleTotals);
#Q18 Find events that have at least one VIP sale. 
SELECT DISTINCT e.event_id, e.event_name FROM events e JOIN ticket_sales ts ON e.event_id = ts.event_id WHERE ts.ticket_type = 'VIP';
#Q19 Find events in cities that have at least one VIP sale.
SELECT event_id, event_name, city FROM events WHERE city IN (SELECT DISTINCT e.city FROM events e JOIN ticket_sales ts ON e.event_id = ts.event_id WHERE ts.ticket_type = 'VIP');
#Q20 Find events that have at least one sale in February 2025.
SELECT DISTINCT e.event_id, e.event_name, e.city FROM events e JOIN ticket_sales ts ON e.event_id = ts.event_id WHERE ts.sale_date >= '2025-02-01' AND ts.sale_date <= '2025-02-28';
#Q21For each event, return the highest price_per_ticket sale row.sale_id event_id sale_date ticket_type qty price_per_ticket
SELECT * FROM ticket_sales ts1 WHERE price_per_ticket = (SELECT MAX(price_per_ticket) FROM ticket_sales ts2 WHERE ts1.event_id = ts2.event_id);
#Q22 Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000. sale_month total_qty total_revenue
SELECT MONTH(sale_date) AS sale_month, SUM(qty) AS total_qty, SUM(price_per_ticket * qty) AS total_revenue FROM ticket_sales GROUP BY MONTH(sale_date) HAVING SUM(price_per_ticket * qty) >= 10000;
#Q23 Show month-wise count of sales rows, but only include months that have at least 3 sales rows. 
SELECT MONTH(sale_date) AS sale_month, COUNT(*) AS sales_rows FROM ticket_sales GROUP BY MONTH(sale_date) HAVING COUNT(*) >= 3;
#Q24 Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. sale_month avg_sale_revenue
SELECT MONTH(sale_date) AS sale_month, AVG(price_per_ticket * qty) AS avg_sale_revenue FROM ticket_sales GROUP BY MONTH(sale_date) HAVING AVG(price_per_ticket * qty) > 4000;
#Q25Show revenue per month and ticket_type, but only include groups where total revenue is at least 5000. sale_month ticket_type total_revenue
SELECT MONTH(sale_date) AS sale_month, ticket_type, SUM(price_per_ticket * qty) AS total_revenue FROM ticket_sales GROUP BY MONTH(sale_date), ticket_type HAVING SUM(price_per_ticket * qty) >= 5000;
