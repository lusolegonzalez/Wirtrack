--ejercicio 2
CREATE TABLE Users (
	users_id INT PRIMARY KEY,
	banned VARCHAR(3) CHECK (banned IN ('Yes', 'No')),
	role VARCHAR(7) CHECK (role IN ('client', 'driver', 'partner'))
);

CREATE TABLE Trips (
	id INT PRIMARY KEY,
	client_id INT,
	driver_id INT,
	city_id INT,
	status VARCHAR(20) CHECK (status IN ('completed', 'cancelled_by_driver',
	'cancelled_by_client')),
	request_at VARCHAR(50),
	CONSTRAINT FK_Trips_Client FOREIGN KEY (client_id) REFERENCES Users(users_id),
	CONSTRAINT FK_Trips_Driver FOREIGN KEY (driver_id) REFERENCES Users(users_id)
);


CREATE TYPE LogTable AS TABLE
(
Id int NOT NULL,
Num varchar NOT NULL
)


--ejercicio 3
DECLARE @LogTable LogTable;

INSERT INTO @LogTable (Id, Num)
VALUES (1, '1'),
       (2, '1'),
       (3, '1'),
       (4, '2'),
       (5, '2'),
       (6, '3'),
       (7, '3'),
       (8, '3'),
       (9, '3'),
       (10, '4');

EXEC BuscarNumerosConsecutivos @LogTable;

