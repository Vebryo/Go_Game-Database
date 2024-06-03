## 1. Display StaffID 
  (obtained from CustomerID replacing 'ST' with 'Staff'), StaffName 
	(obtained from StaffName in uppercase format), and Total Sales (obtained from the total sales) 
	for each staff whose gender equals to Male, and customer handled gender equals to Female.

```sql
SELECT REPLACE(c.CustomerID, 'CU', 'Staff') AS StaffID, UPPER(s.StaffName) AS StaffName, COUNT(sd.SalesID) AS TotalSales
	FROM SalesHeader sh
	JOIN MsStaff s ON s.StaffID = sh.StaffID
	JOIN MsCustomer c ON c.CustomerID = sh.CustomerID
	JOIN SalesDetail sd ON sd.SalesID = sh.SalesID
	WHERE s.StaffGender = 'Male' AND c.CustomerGender = 'Female'
	GROUP BY c.CustomerID, s.StaffName;
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/1c7bf3cc-37b4-4753-8c52-a5122ef37971)
## 2. Display PurchaseID, PurchaseDate
(obtained from PurchaseDate in 'dd/MM/yyyy' format), Total Game Type 
	(obtained from the total of GameType) 
	for every purchase that occurs in 2019 and total GameType purchased is more than 2.
 ```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/c9bf1d39-c79b-4af5-a7f3-e736143afa3a)
## 3. Display CustomerCode 
  (obtained from reversing CustomerID), CustomerName 
	(obtained from CustomerName in uppercase format), TotalTransaction 
	(obtained from the total of customer transaction and no duplicate data), 
	and MinimumPurchase (obtained from the minimum purchase quantity for the transaction) 
	for every customer which name starts with 'M' and TotalTransaction made is more than 1.
 ```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/6d3b66c3-dfca-4bba-b7c6-d22a3e336d43)
## 4 Display SupplierID, SupplierName 
    (obtained from SupplierName added with ' Inc.' in the end of SupplierName), 
		TotalGamesSold (obtained from sum of quantity sold), MaximumGamesSold (Obtained from the maximum quantity sold in a transaction)
		for every supplier which address contains 'Drive' and SupplierID digit is an odd number.
  ```sql
	SELECT ms.SupplierID,
       CONCAT(SupplierName, ' Inc.') AS SupplierName,
       SUM(Quantity) AS TotalGamesSold,
       MAX(Quantity) AS MaximumGamesSold
		FROM MsSupplier ms
		JOIN PurchaseHeader pc ON ms.SupplierID = pc.SupplierID
		JOIN PurchaseDetail pd On pd.PurchaseID = pc.PurchaseID
		WHERE SupplierAddress LIKE '%Drive%' AND CAST(RIGHT(ms.SupplierID, 3) AS INT) % 2 = 1
		GROUP BY ms.SupplierID, CONCAT(SupplierName, ' Inc.')
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/28e3a751-252d-47a7-bd7d-42cb558d228c)
## 5 Display PurchaseID, SupplierID, SupplierName, StaffFirstName 
    (obtained from the first word of StaffName), 
		StaffDOB for every transaction that is handled by Staff whose salary is above the staff 
		average salary and Staff year of birth is greater than 2000. (ALIAS SUBQUERY)
  ```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/db1d5ee0-1ce8-492e-95c4-2d562d77e34c)
## 6 Display SalesID, SalesDate, CustomerName 
  (obtained from CustomerName in lowercase format) 
	for every transaction that serves customer 
	whose age is below 24 and quantity is more than the average of transaction quantity. (ALIAS SUBQUERY)
```sql
SELECT S.SalesID,
       S.SalesDate,
       LOWER(C.CustomerName) AS CustomerName
FROM SalesHeader S
INNER JOIN MsCustomer C ON C.CustomerID = s.CustomerID
JOIN SalesDetail sd ON sd.SalesID = s.SalesID,
(SELECT AVG (Quantity)AS averageOfTransactionQuantity FROM SalesDetail)AS SUBQUERY
WHERE DATEDIFF(YEAR,CustomerDOB,GETDATE())<24
  AND Quantity > SUBQUERY.averageOfTransactionQuantity
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/2538174d-7dc9-4d62-a8e6-f30f8f54d1d1)
## 7 Display PurchasedDay 
(obtained from the dayname of the TransactionDate), GameID (obtained from GameID replacing 'GA' with 'Game'), GameReleasedYear 
(Obtained from the year of the GameReleaseDate), TotalPurchased (obtained from the Total quantity of GamePurchased) 
for every game which price is more than the average price and released in the second quarter of the year. (ALIAS SUBQUERY)
```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/8a37450a-2c18-488e-8d5a-aa60a6659ea4)
## 8 Display SalesID 
(obtained from SaleID in lowercase format), SalesDate (obtained from SalesDate in 'dd-MMM-yyy' format), TotalSalesCost  
(obtained from sum of Quantity * GamePrice and added with 'Rp. ' in front of TotalSalesCost) 
for every transaction who is handled by staff which salary is higher than average staff salary and 
transaction occurs in February. (ALIAS SUBQUERY)
```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/1a24a91a-d493-4934-a903-584ed042561d)
## 9 Create a view named 'Customer_Quarterly_Transaction_View' to display CustomerID, CustomerName, TotalTransaction 
  (obtained from the total of transaction), MaximumPurchaseQuantity (obtained from the maximum quantity of transaction added with 'Pc(s)' 
  in the end of MaximumPurchaseQuantity) for every customer who made a transaction in 2021 and handled by 
  staff whose gender is Female.
  ```sql
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
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/ed043fea-77bd-4d97-b5ed-634fb8538aa3)
## 10 Create a view named 'QuarterlySalesReport' to display TotalSales 
	(obtained from sum of Quantity * GamePrice and added with 'Rp.' in front of TotalSales), and AverageSales 
	(obtained from average of Quantity * Gameprice and added with 'Rp.' in front of AverageSales)
	for every transaction that occurs in the first quarter and GamePrice is higher than 200000.
```sql 
CREATE VIEW QuarterlySalesReport AS
	
	SELECT
		[TotalSales] = CONCAT('Rp. ', FORMAT(SUM(Quantity * GamePrice), '#,0')),
    CONCAT('Rp. ', FORMAT(AVG(Quantity * GamePrice), '#,0')) 
		 AS AverageSales
	FROM SalesDetail sd
	JOIN MsGame mg ON mg.GameID = sd.GameID
	JOIN SalesHeader sh ON sh.SalesID = sd.SalesID
	WHERE DATENAME(QUARTER, SalesDate)= 1 AND GamePrice > 200000
```
![image](https://github.com/Vebryo/Go_Game-Database/assets/171486386/1cdff7c2-0810-4bc6-b1b2-b4b6255c5a36)
