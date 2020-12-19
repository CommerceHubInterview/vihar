/* Little Bobby Tables Attempt at Modeling*/
 
CREATE TABLE dbo.customer
( customerId BIGINT IDENTITY(1,1)
, firstName NVARCHAR(50) NOT NULL
, lastName NVARCHAR(50) NOT NULL
, phoneNumber VARCHAR(20) NOT NULL
, emalAddress NVARCHAR(100) NOT NULL
, CONSTRAINT PK_customer_customerId PRIMARY KEY CLUSTERED (customerId)
);
GO
 
CREATE TABLE dbo.reservation
( reservationId TINYINT IDENTITY(1,1)
, customerId BIGINT NOT NULL
, roomNumber INT NOT NULL
, roomType VARCHAR(20) NOT NULL
, reservationStart DATE NOT NULL
, reservationEnd DATETIME
, is_active BIT NOT NULL
, CONSTRAINT PK_reservation_reservationId PRIMARY KEY CLUSTERED (reservationId)
);
GO
 
ALTER TABLE dbo.reservation WITH CHECK ADD CONSTRAINT FK_customer_customerId FOREIGN KEY(customerId)
REFERENCES dbo.customer (customerId);
GO
 
CREATE NONCLUSTERED INDEX IX_reservation_reservationStart_reservationEnd_inc ON dbo.reservation (reservationEnd, reservationStart) INCLUDE (is_active);
GO
