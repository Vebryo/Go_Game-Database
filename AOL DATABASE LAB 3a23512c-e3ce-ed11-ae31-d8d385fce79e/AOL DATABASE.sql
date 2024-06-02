
CREATE DATABASE GoGame
go
use GoGame
go

DROP DATABASE GoGame


SELECT * FROM MsStaff
SELECT * FROM MsGameType
SELECT * FROM MsGame
SELECT * FROM MsCustomer
SELECT * FROM MsSupplier
SELECT * FROM PurchaseHeader
SELECT * FROM PurchaseDetail
SELECT * FROM SalesHeader
SELECT * FROM SalesDetail

DROP DATABASE GoGame

CREATE TABLE [MsStaff] (
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffAddress VARCHAR(50)NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffSalary FLOAT (50)NOT NULL,
	StaffPhoneNumber VARCHAR(13)NOT NULL
)

CREATE TABLE[MsGameType](
GameTypeID CHAR(5) PRIMARY KEY CHECK (GameTypeID LIKE 'GT[0-9][0-9][0-9]'),
GameTypeName VARCHAR(50)NOT NULL

)
INSERT INTO [MsGameType] VALUES
    ('GT001', 'RPG'),
    ('GT002', 'Sandbox'),
    ('GT003', 'TPS'),
    ('GT004', 'Adventure'),
    ('GT005', 'Sport'),
	('GT006','Moba'),
	('GT007','Horor'),
	('GT008','Fighting'),
	('GT009', 'Simulation'),
	('GT010', 'FPS'); 


CREATE TABLE [MsGame](
GameID CHAR(5) PRIMARY KEY CHECK (GameID LIKE 'GA[0-9][0-9][0-9]'),
GameTypeID CHAR(5) FOREIGN KEY REFERENCES MsGameType(GameTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
GameName VARCHAR(50) NOT NULL,
GamePrice FLOAT(50) NOT NULL,
ReleaseDate DATE NOT NULL
)

INSERT INTO [MsGame] (GameID, GameTypeID, GameName, GamePrice, ReleaseDate)
VALUES
    ('GA001', 'GT001', 'Dynasty Warior', 200.000, '2022-05-15'),
    ('GA002', 'GT002', 'Bully', 180.000, '2021-09-30'),
    ('GA003', 'GT001', 'Gta Sanadreas', 80.000, '2023-01-12'),
    ('GA004', 'GT003', 'Gundu Online', 90.000, '2022-07-22'),
    ('GA005', 'GT002', 'Dota2', 100.000, '2023-03-05'),
    ('GA006', 'GT003', 'Subway Surfer', 300.000, '2021-12-01'),
    ('GA007', 'GT001', 'Banana Boat', 100.000, '2022-08-18'),
    ('GA008', 'GT002', 'Gundu Online', 400.000, '2023-02-10'),
    ('GA009', 'GT003', 'Congklak Online', 800.000, '2021-11-25'),
    ('GA010', 'GT001', 'Naga Bonar', 300.000, '2022-06-08');


INSERT INTO [MsStaff] (StaffID, StaffName, StaffGender, StaffAddress, StaffDOB, StaffSalary, StaffPhoneNumber)
VALUES
    ('ST001', 'Riski ahmad', 'Male', '123 Kem St', '1990-01-01', 5000, '087889990098'),
    ('ST002', 'Aqil Smith', 'Male', '456 Teb St', '2001-05-10', 2000, '089876543210'),
    ('ST003', 'Hana Johnson', 'Female', '789 Cik St', '2001-03-15', 2000, '085555555555'),
    ('ST004', 'Frewin Brown', 'Male', '321 Pine St', '2005-07-20', 2000, '086999999999'),
    ('ST005', 'Ilham Bakri', 'Male', '987 Mangg St', '2010-11-30', 5800, '089711111111'),
    ('ST006', 'Djahwan Kamil', 'Male', '654 Maple St', '1995-09-25', 5300, '087144444444'),
    ('ST007', 'Iki Mustofa', 'Male', '234 Bin St', '1993-12-05', 5700, '085522222222'),
    ('ST008', 'Arjuno Putri', 'Female', '876 Birch St', '1991-06-12', 5400, '086588888888'),
    ('ST009', 'Farid Wilson', 'Male', '543 Oak St', '1989-04-18', 5900, '083477777777'),
    ('ST010', 'Anggi Martinez', 'Female', '765 Elm St', '1997-08-15', 5100, '084533333333');

CREATE TABLE [MsCustomer] (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerPhoneNumber VARCHAR(13)NOT NULL
)




INSERT INTO [MsCustomer] (CustomerID, CustomerName, CustomerGender, CustomerDOB, CustomerPhoneNumber)
VALUES
    ('CU001', 'Najmi Kimus', 'Male', '2000-05-15', '081234567890'),
    ('CU002', 'Mustofa Ikoy', 'Male', '1995-08-21', '089879943210'),
    ('CU003', 'Randika Putra deden', 'Male', '2000-12-10', '085557534567'),
    ('CU004', 'Ferdy Chandra', 'Male', '1992-03-28', '089934887777'),
    ('CU005', 'Sarah Amel', 'Female', '1997-06-02', '084442156666'),
    ('CU006', 'Nasywa Kamila', 'Female', '1993-09-17', '084378889999'),
    ('CU007', 'Kemal Rasyid', 'Male', '1991-11-05', '082221234444'),
    ('CU008', 'Joulin Clark', 'Female', '1989-04-12', '086787778888'),
    ('CU009', 'Jonathan Sutyanto', 'Male', '1994-07-23', '081180223333'),
    ('CU010', 'Rohani Syahpitri', 'Female', '1996-02-09', '088669990000');

	

	


CREATE TABLE[MsSupplier] (
	SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]'),
	SupplierName VARCHAR(50)NOT NULL,
	SupplierAddress VARCHAR(50)NOT NULL,
	SupplierPhoneNumber VARCHAR(13)NOT NULL

)

INSERT INTO [MsSupplier] (SupplierID, SupplierName, SupplierAddress, SupplierPhoneNumber)
VALUES
    ('SU001', 'ABC Supplier', '123 Main Drive', '0833334567890'),
    ('SU002', 'XYZ Supplier', '456 Elm Drive', '0833376543210'),
    ('SU003', 'Supplier Dro.', '789 Oak Avenue', '0845551234567'),
    ('SU004', 'Glodok Suppliers', '321 Haji Lane', '0859998887777'),
    ('SU005', 'Senen Supplier', '987 Puso Road', '0894445556666'),
    ('SU006', 'Atrium Suppliers', '654 Enclek Court', '0857778889999'),
    ('SU007', 'BlokA Supplier', '234 Barkah Street', '0802223334444'),
    ('SU008', 'TanahAbang Supplier', '876 Raden Avenue', '0876667778888'),
    ('SU009', 'Asemka Suppliers', '543 Wadas Lane', '0891112223333'),
    ('SU010', 'Pop Supplier', '890 Pulo Road', '0898889990000');

	
	

CREATE TABLE [PurchaseHeader] (
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SupplierID CHAR(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseDate DATE NOT NULL
	
)
INSERT INTO [PurchaseHeader] (PurchaseID, StaffID, SupplierID, PurchaseDate)
VALUES
    ('PU001', 'ST001', 'SU001', '2019-01-01'),
    ('PU002', 'ST002', 'SU002', '2019-01-02'),
    ('PU003', 'ST003', 'SU003', '2023-01-03'),
    ('PU004', 'ST004', 'SU004', '2023-01-04'),
    ('PU005', 'ST005', 'SU005', '2023-01-05'),
    ('PU006', 'ST006', 'SU006', '2023-01-06'),
    ('PU007', 'ST007', 'SU007', '2023-01-07'),
    ('PU008', 'ST008', 'SU008', '2023-01-08'),
    ('PU009', 'ST009', 'SU009', '2023-01-09'),
    ('PU010', 'ST003', 'SU010', '2023-01-10'),
    ('PU011', 'ST007', 'SU001', '2023-01-11'),
    ('PU012', 'ST002', 'SU002', '2023-01-12'),
    ('PU013', 'ST001', 'SU003', '2023-01-13'),
    ('PU014', 'ST008', 'SU004', '2023-01-14'),
    ('PU015', 'ST010', 'SU005', '2023-01-15');


CREATE TABLE [PurchaseDetail] (
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseHeader(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	GameID CHAR(5) FOREIGN KEY REFERENCES MsGame(GameID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL CHECK (Quantity > 0)
)

INSERT INTO [PurchaseDetail] (PurchaseID, GameID, Quantity)
VALUES
    ('PU001', 'GA001', '2'),
    ('PU001', 'GA002', '1'),
    ('PU002', 'GA003', '3'),
    ('PU003', 'GA001', '1'),
    ('PU004', 'GA004', '2'),
    ('PU005', 'GA002', '4'),
    ('PU006', 'GA003', '2'),
    ('PU007', 'GA001', '3'),
    ('PU008', 'GA004', '1'),
    ('PU009', 'GA002', '2'),
    ('PU010', 'GA003', '1'),
    ('PU011', 'GA004', '3'),
    ('PU012', 'GA001', '2'),
    ('PU013', 'GA002', '1'),
    ('PU014', 'GA003', '2'),
    ('PU015', 'GA004', '4'),
    ('PU013', 'GA001', '1'),
    ('PU003', 'GA002', '3'),
    ('PU001', 'GA003', '2'),
    ('PU002', 'GA004', '1'),
    ('PU015', 'GA001', '2'),
    ('PU010', 'GA002', '1'),
    ('PU010', 'GA003', '4'),
    ('PU009', 'GA004', '2'),
    ('PU013', 'GA001', '3'),
    ('PU015', 'GA002', '1');



	


CREATE TABLE [SalesHeader](
SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SalesDate DATE NOT NULL

)

INSERT INTO [SalesHeader] (SalesID, StaffID, CustomerID, SalesDate)
VALUES
    ('SA001', 'ST001', 'CU001', '2021-01-01'),
    ('SA002', 'ST002', 'CU002', '2021-02-21'),
    ('SA003', 'ST003', 'CU003', '2021-03-21'),
    ('SA004', 'ST004', 'CU004', '2019-04-30'),
    ('SA005', 'ST005', 'CU005', '2004-05-23'),
    ('SA006', 'ST006', 'CU006', '2021-06-12'),
    ('SA007', 'ST007', 'CU007', '2009-01-07'),
    ('SA008', 'ST008', 'CU008', '2021-02-08'),
    ('SA009', 'ST009', 'CU009', '2011-01-09'),
    ('SA010', 'ST010', 'CU010', '2012-02-10'),
    ('SA011', 'ST002', 'CU001', '2014-03-11'),
    ('SA012', 'ST001', 'CU003', '2015-01-12'),
    ('SA013', 'ST006', 'CU008', '2012-03-13'),
    ('SA014', 'ST008', 'CU010', '2019-01-14'),
    ('SA015', 'ST010', 'CU001', '2019-03-15');

	



CREATE TABLE[SalesDetail](
SalesID CHAR(5) FOREIGN KEY REFERENCES SalesHeader(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
GameID CHAR(5) FOREIGN KEY REFERENCES MsGame(GameID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
Quantity INT NOT NULL CHECK (Quantity > 0)

)
INSERT INTO [SalesDetail] (SalesID, GameID, Quantity)
VALUES
    ('SA001', 'GA001', '10'),
    ('SA001', 'GA002', '5'),
    ('SA001', 'GA003', '3'),
    ('SA002', 'GA004', '2'),
    ('SA002', 'GA005', '8'),
    ('SA003', 'GA006', '4'),
    ('SA004', 'GA007', '6'),
    ('SA004', 'GA008', '12'),
    ('SA005', 'GA009', '9'),
    ('SA005', 'GA010', '7'),
    ('SA006', 'GA003', '15'),
    ('SA007', 'GA004', '11'),
    ('SA007', 'GA009', '4'),
    ('SA008', 'GA001', '6'),
    ('SA009', 'GA003', '8'),
    ('SA009', 'GA001', '3'),
    ('SA010', 'GA006', '10'),
    ('SA011', 'GA009', '5'),
    ('SA011', 'GA010', '7'),
    ('SA012', 'GA002', '9'),
    ('SA013', 'GA001', '12'),
    ('SA014', 'GA005', '6'),
    ('SA014', 'GA002', '4'),
    ('SA015', 'GA007', '8'),
    ('SA015', 'GA010', '10');


	--Query to simulate transaction process

	--Aqil Kamil Sebagai Customer memasukan data diri untuk membeli game ke Gogame pada tanggal 6 bulan januari 2023 
	--dia memasukan id,nama,gender,tanggal lahir, dan nomor telephone


	INSERT INTO MsCustomer VALUES
	('CU011', 'Aqil Kamil', 'Male', '1992-03-28', '087934887777')

	--Pada tanggal 6 januari 2023 Aqil Kamil membeli game :
	-- 1. Dynasty Warrior Sebanyak 10

	INSERT INTO SalesHeader VALUES
	('SA016', 'ST010','CU011','2023-06-01')

	INSERT INTO SalesDetail VALUES
	('SA001', 'GA001','10')

	
	

	--1. Display StaffID (obtained from CustomerID replacing 'ST' with 'Staff'), StaffName 
	--(obtained from StaffName in uppercase format), and Total Sales (obtained from the total sales) 
	--for each staff whose gender equals to Male, and customer handled gender equals to Female.
	SELECT REPLACE(c.CustomerID, 'CU', 'Staff') AS StaffID, UPPER(s.StaffName) AS StaffName, COUNT(sd.SalesID) AS TotalSales
	FROM SalesHeader sh
	JOIN MsStaff s ON s.StaffID = sh.StaffID
	JOIN MsCustomer c ON c.CustomerID = sh.CustomerID
	JOIN SalesDetail sd ON sd.SalesID = sh.SalesID
	WHERE s.StaffGender = 'Male' AND c.CustomerGender = 'Female'
	GROUP BY c.CustomerID, s.StaffName;


	--2. Display PurchaseID, PurchaseDate (obtained from PurchaseDate in 'dd/MM/yyyy' format), Total Game Type 
	--(obtained from the total of GameType) 
	--for every purchase that occurs in 2019 and total GameType purchased is more than 2.
		SELECT 
		ph.PurchaseID,
		PurchaseDate =  CONVERT(VARCHAR,PurchaseDate,103),
		[TotalGameType] = COUNT  (mg.GameTypeID)

		FROM PurchaseHeader ph
		JOIN PurchaseDetail pd ON ph.PurchaseID = pd.PurchaseID
		JOIN MsGame mg ON mg.GameID = pd.GameID
		JOIN MsGameType mgt ON mgt.GameTypeID = mg.GameTypeID
		WHERE YEAR (PurchaseDate) = 2019
		
		GROUP BY ph.PurchaseID,CONVERT(VARCHAR,PurchaseDate,103)
		HAVING COUNT (mg.GameTypeID)>2

		--3 Display CustomerCode (obtained from reversing CustomerID), CustomerName 
		--(obtained from CustomerName in uppercase format), TotalTransaction 
		--(obtained from the total of customer transaction and no duplicate data), 
		--and MinimumPurchase (obtained from the minimum purchase quantity for the transaction) 
		--for every customer which name starts with 'M' and TotalTransaction made is more than 1.

			SELECT 
			[CustomerCode] = REVERSE (mc.CustomerID),
			[CustomerName] = UPPER(mc.CustomerName),
			[TotalTransaction] = COUNT(sh.SalesID),
			[MinimumPurchase] = MIN(Quantity)

			FROM MsCustomer mc
			JOIN SalesHeader sh ON sh.CustomerID = mc.CustomerID
			JOIN SalesDetail sd ON sd.SalesID = sh.SalesID
			WHERE LEFT (CustomerName,1)= 'M' 
			GROUP BY UPPER(mc.CustomerName),mc.CustomerID
			HAVING  COUNT(sh.SalesID)>1

			--4
			--Display SupplierID, SupplierName (obtained from SupplierName added with ' Inc.' in the end of SupplierName), 
			--TotalGamesSold (obtained from sum of quantity sold), MaximumGamesSold (Obtained from the maximum quantity sold in a transaction)
			--for every supplier which address contains 'Drive' and SupplierID digit is an odd number.
		 
			SELECT ms.SupplierID,
       CONCAT(SupplierName, ' Inc.') AS SupplierName,
       SUM(Quantity) AS TotalGamesSold,
       MAX(Quantity) AS MaximumGamesSold
		FROM MsSupplier ms
		JOIN PurchaseHeader pc ON ms.SupplierID = pc.SupplierID
		JOIN PurchaseDetail pd On pd.PurchaseID = pc.PurchaseID
		WHERE SupplierAddress LIKE '%Drive%' AND CAST(RIGHT(ms.SupplierID, 3) AS INT) % 2 = 1
		GROUP BY ms.SupplierID, CONCAT(SupplierName, ' Inc.') 

		--5 Display PurchaseID, SupplierID, SupplierName, StaffFirstName (obtained from the first word of StaffName), 
		--StaffDOB for every transaction that is handled by Staff whose salary is above the staff 
		--average salary and Staff year of birth is greater than 2000. (ALIAS SUBQUERY)

		
	SELECT
    PurchaseID,
    ms.SupplierID,
    SupplierName,
    [StaffFirstName] = SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName + ' ') -1),
    StaffDoB
FROM MsSupplier ms
JOIN PurchaseHeader ph ON ms.SupplierID = ph.SupplierID
JOIN MsStaff st ON ph.StaffID = st.StaffID, (
    SELECT [AverageSalary] = AVG(StaffSalary) 
    FROM MsStaff
) AS x
WHERE StaffSalary > x.AverageSalary
AND YEAR(StaffDoB) > 2000

	--6 Display SalesID, SalesDate, CustomerName (obtained from CustomerName in lowercase format) 
	--for every transaction that serves customer 
	--whose age is below 24 and quantity is more than the average of transaction quantity. (ALIAS SUBQUERY)
	


	SELECT S.SalesID,
       S.SalesDate,
       LOWER(C.CustomerName) AS CustomerName
FROM SalesHeader S
INNER JOIN MsCustomer C ON C.CustomerID = s.CustomerID
JOIN SalesDetail sd ON sd.SalesID = s.SalesID,
(SELECT AVG (Quantity)AS averageOfTransactionQuantity FROM SalesDetail)AS SUBQUERY
WHERE DATEDIFF(YEAR,CustomerDOB,GETDATE())<24
  AND Quantity > SUBQUERY.averageOfTransactionQuantity

  --7 Display PurchasedDay (obtained from the dayname of the TransactionDate), GameID (obtained from GameID replacing 'GA' with 'Game'), GameReleasedYear 
  --(Obtained from the year of the GameReleaseDate), TotalPurchased (obtained from the Total quantity of GamePurchased) 
  --for every game which price is more than the average price and released in the second quarter of the year. (ALIAS SUBQUERY)

  SELECT 
  [PurchasedDay]= DATENAME(WeekDay,PurchaseDate),
  [GameID] = REPLACE(mg.GameID,'GA','Game'),
  [GameRelasedYear] = YEAR(mg.ReleaseDate),
  [TotalPurchased] = COUNT(ph.PurchaseID)
  FROM PurchaseHeader ph
  JOIN PurchaseDetail pd ON pd.PurchaseID = ph.PurchaseID
  JOIN MsGame mg ON mg.GameID = pd.GameID,
  (SELECT AVG(GamePrice)AS Average FROM MsGame
  
  )AS SUBQUERY
  WHERE GamePrice > SUBQUERY.Average
	GROUP BY DATENAME(WeekDay,PurchaseDate),REPLACE(mg.GameID,'GA','Game'),YEAR(mg.ReleaseDate)

	--8 Display SalesID (obtained from SaleID in lowercase format), SalesDate (obtained from SalesDate in 'dd-MMM-yyy' format), TotalSalesCost  
	--(obtained from sum of Quantity * GamePrice and added with 'Rp. ' in front of TotalSalesCost) 
	--for every transaction who is handled by staff which salary is higher than average staff salary and 
	--transaction occurs in February. (ALIAS SUBQUERY)
	SELECT 
	[SalesID] = LOWER(sh.SalesID),
	[SalesDate]= CONVERT(VARCHAR,SalesDate,105),
	[TotalSalesCost]= CONCAT('Rp. ', FORMAT(SUM(Quantity * GamePrice),'#,0'))

	

	FROM SalesHeader sh
	JOIN SalesDetail sd ON  sd.SalesID = sh.SalesID
	JOIN MsStaff ms ON ms.StaffID = sh.StaffID
	JOIN MsGame mg ON mg.GameID = sd.GameID,
	
	 (SELECT AVG(StaffSalary)AS Average FROM MsStaff
	
  )AS SUBQUERY
  WHERE StaffSalary  > SUBQUERY.Average
  GROUP BY LOWER(sh.SalesID),CONVERT(VARCHAR,SalesDate,105)

  --9 Create a view named 'Customer_Quarterly_Transaction_View' to display CustomerID, CustomerName, TotalTransaction 
  --(obtained from the total of transaction), MaximumPurchaseQuantity (obtained from the maximum quantity of transaction added with 'Pc(s)' 
  --in the end of MaximumPurchaseQuantity) for every customer who made a transaction in 2021 and handled by 
  --staff whose gender is Female.

	CREATE VIEW Customer_Quarterly_Transaction_View AS
	SELECT 
	mc.CustomerID,
	CustomerName,
	[TotalTransaction] = COUNT(sh.SalesID),
	[MaximumPurchaseQuantity] = CONCAT (MAX(sd.Quantity),'Pc(s)')
	
	FROM MsCustomer mc
	JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID
	JOIN MsStaff ms ON ms.StaffID = sh.StaffID
	JOIN SalesDetail sd ON sd.SalesID = sh.SalesID
	WHERE YEAR(SalesDate) = 2021 AND StaffGender = 'Female'
	GROUP BY CustomerName , mc.CustomerID
	

	--10 Create a view named 'QuarterlySalesReport' to display TotalSales 
	--(obtained from sum of Quantity * GamePrice and added with 'Rp.' in front of TotalSales), and AverageSales 
	--(obtained from average of Quantity * Gameprice and added with 'Rp.' in front of AverageSales)
	--for every transaction that occurs in the first quarter and GamePrice is higher than 200000.
	
	

	CREATE VIEW QuarterlySalesReport AS
	
	SELECT
		[TotalSales] = CONCAT('Rp. ', FORMAT(SUM(Quantity * GamePrice), '#,0')),
    CONCAT('Rp. ', FORMAT(AVG(Quantity * GamePrice), '#,0')) 
		 AS AverageSales
	FROM SalesDetail sd
	JOIN MsGame mg ON mg.GameID = sd.GameID
	JOIN SalesHeader sh ON sh.SalesID = sd.SalesID
	WHERE DATENAME(QUARTER, SalesDate)= 1 AND GamePrice > 200000



	SELECT * FROM QuarterlySalesReport


	

	


	


			




	
