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