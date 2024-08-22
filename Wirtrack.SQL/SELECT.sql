--ejercicio 2
SELECT 
  request_at AS dia,
  ROUND(
    SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) / 
    COUNT(*), 2
  ) AS tasa_de_cancelacion
FROM 
  Trips
  INNER JOIN Users ON Trips.client_id = Users.users_id
WHERE 
  Users.banned = 'No'
GROUP BY 
  request_at
