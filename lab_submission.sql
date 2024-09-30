-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
DO
  INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
  SELECT AVG(waiting_time_minutes) 
  FROM customer_service_ticket
  WHERE ticket_timestamp >= NOW() - INTERVAL 1 HOUR;
SHOW EVENTS;