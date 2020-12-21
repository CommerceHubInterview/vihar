/* Little Bobby Tables Attempt at Modeling*/
 
CREATE TABLE dbo.customer
( customerId BIGINT IDENTITY(1,1)
, firstName NVARCHAR(50) NOT NULL
, lastName NVARCHAR(50) NOT NULL
, phoneNumber numeric(8)) NOT NULL
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


CREATE TABLE dbo.reservation
( reservationId BIGINT IDENTITY(1,1)
, customerId BIGINT NOT NULL
, roomID smallint not null
, reservationStartDate DATE NOT NULL
, reservationEndDate DATE  Not null
, roomRate smallINT not null
, totalAmount Numberic(10,2) Not null
, resvervationCancleDate Date 
, resvervationStatus BIT NOT NULL
, CONSTRAINT PK_reservation_reservationId PRIMARY KEY CLUSTERED (reservationId)
);
GO

create table dbo.room
{
    roomID smallint not null
    ,roomType VARCHAR(20) NOT NULL
    ,roomRate  Numberic(10,2) Not null,
    ,roomPatFridelyFlag char(1) null,
    ,roomDisabilityFlag char(1) null,
    ,CONSTRAINT pk_room_roomID PRIMARY KEY
}


Create Table dbo.Guest
(  
  reservationId BIGINT not Null,
, customerId BIGINT NOT NULL
, roomID smallINT NOT NULL
, roomType VARCHAR(20) NOT NULL
, checkinDate DATE NOT NULL
, checkoutEnd DATE NOT NULL
, roomRate smallINT not null
, totalAmount Numberic(10,2) Not null
, paymentMethod
)