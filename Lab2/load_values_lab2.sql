INSERT INTO Stores VALUES
(100, 'Walgreens', '201 Front St', 'Robert Johnson'),
(200, 'CVS', '600 Front St', 'David Smith'),
(300, 'Computer Zone', '314 Laurel St', 'Shel Finkelstein'),
(400, 'Best Buy', '2650 41st Ave', 'John Williams'),
(500, 'Home Depot', '2600 41st Ave', NULL),
(600, 'Pacific Surf Shop', '1502 Pacific Ave', 'Shel Finkelstein'),
(700, 'Marshalls', '1664 Commercial Way', 'Peter Davis'),
(800, 'Safeway', '2111 Mission St', 'George Jetson'),
(900, 'Bookshop Santa Cruz', '1520 Pacific Ave', 'Shel Finkelstein');

INSERT INTO Customers VALUES
(1, 'George Gomez', '401 Heller Dr', 'george@mail.com'),
(2, 'Mary Betancourt', '304 Cliff St', 'mary@mail.com'),
(3, 'Anne Jameson', '1735 Alma St', 'anne@mail.com'),
(4, 'Angie Smith', '411 Broadway St', NULL),
(5, 'Lisa Garcia', '1795 Holly St', 'lisa@mail.com'),
(6, 'Shel Finkelstein', '3039 River St', 'shel@ucsc.edu'),
(7, 'Kathy Jones', '1984 Forest Ave', NULL),
(8, 'Robert Johnson', '1213 Bridge Ave', NULL),
(9, 'Debora Peterson', '4912 Water Str', 'debora@mail.com'),
(10, 'Catherine Washington', '5050 River Str', 'catherine@mail.com');

INSERT INTO Products VALUES
(1000, 'Iphone 7', 'Electronics', 'Apple'),
(2000, 'Tide Liquid', 'Detergent', 'Tide'),
(3000, 'Rice Krispies', 'Food', 'Kellogg'), 
(4000, 'Sprite', 'Beverage', 'The Coca-Cola Co.'),
(5000, 'Corn Flakes', 'Food', 'Kellogg'),
(6000, 'HP Deskjet 1112', 'Electronics', 'HP');

INSERT INTO Sales VALUES
(200, 1, 1000, '09/15/2016', 1, 702.68, true),
(200, 2, 1000, '09/15/2016', 2, 1405.36, true),
(200, 3, 1000, '09/15/2016', 1, 702.68, true),
(200, 4, 1000, '09/30/2016', 1, 702.68, false),
(200, 5, 1000, '09/30/2016', 1, 702.68, false),
(200, 6, 1000, '09/30/2016', 3, 2108.04, false),
(100, 2, 2000, '10/01/2016', 2, 20.36, true),
(100, 4, 2000, '10/01/2016', 3, 30.54, true),
(800, 7, 3000, '07/04/2016', 2, 6.68, true),
(800, 9, 3000, '07/04/2016', 3, 10.02, true),
(300, 3, 3000, '10/01/2016', 10, 35.40, true),
(800, 1, 5000, '10/01/2016', 1, 3.25, true),
(800, 2, 5000, '10/01/2016', 3, 9.75, true),
(800, 10, 3000, '10/01/2016', 15, 50.10, true),
(800, 6, 3000, '07/04/2016', 20, 66.80, true),
(800, 6, 5000, '07/04/2016', 20, 65.00, true),
(800, 5, 5000, '10/02/2016', 30, 97.50, false);



