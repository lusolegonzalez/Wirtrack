﻿--ejercicio 2
INSERT INTO Users
(users_id, banned, role)
VALUES
( 1 , 'No' , 'client'),
( 2 , 'No' , 'client'),
( 3 , 'Yes' , 'client'),
( 4 , 'No' , 'client'),
( 10 , 'No' , 'driver'),
( 11 , 'No' , 'driver'),
( 12 , 'No' , 'driver'),
( 13 , 'No' , 'driver')


INSERT INTO Trips( id , client_id , driver_id , city_id , status , request_at)
VALUES
( 1 , 1 , 10 , 1 , 'completed' , '2013-10-01' ),
( 2 , 2 , 11 , 1 , 'cancelled_by_driver' , '2013-10-01' ),
( 3 , 3 , 12 , 6 , 'completed' , '2013-10-01' ),
( 4 , 4 , 13 , 6 , 'cancelled_by_client' , '2013-10-01' ),
( 5 , 1 , 10 , 1 , 'completed' , '2013-10-02' ),
( 6 , 2 , 11 , 6 , 'completed' , '2013-10-02' ),
( 7 , 3 , 12 , 6 , 'completed' , '2013-10-02' ),
( 8 , 2 , 12 , 12 , 'completed' , '2013-10-03' ),
( 9 , 3 , 10 , 12 , 'completed' , '2013-10-03' ),
( 10 , 4 , 13 , 12 , 'cancelled_by_driver' ,'2013-10-03')