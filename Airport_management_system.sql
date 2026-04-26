USE Airport_management_system;
show tables;
create table passenger(passenger_id int primary Key, Name varchar(50),Age int,gender varchar(10),phone varchar(15));
show tables;
 create table flight(flight_id int primary key,
  flight_name varchar(50), SOURCE varchar(50),Destination Varchar(50),departure_time time);
  show tables;
  describe flight;
  describe passenger;
  desc booking;
  create table Ticket(ticket_id INT PRIMARY KEY,passenger_id int,flight_id int,seat_no VARCHAR(10),price INT,FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id), FOREIGN KEY(flight_id) REFERENCES flight(flight_id)); 
 use Airport_management_system;
 show tables;
 describe ticket;
 create table staff(staff_id INT PRIMARY KEY,staff_Name VARCHAR(50),Role Varchar(30),Salary INT);
 Create table Airport(Airport_id INT PRIMARY KEY,Airport_name VARCHAR(50),City VARCHAR(50),Country VARCHAR(50));
 create table Gate(Gate_id INT PRIMARY KEY,Gate_number VARCHAR(10),Flight_id INT,FOREIGN KEY (flight_id) REFERENCES flight(flight_id));
 create table Booking(Booking_id INT PRIMARY KEY,passenger_id INT,Booking_date DATE, Status VARCHAR(20),FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id));
 show tables;
 describe airport;

 ALTER TABLE ticket MODIFY price FLOAT;
 ALTER TABLE staff MODIFY salary FLOAT;
ALTER TABLE Airport MODIFY Airport_id VARCHAR(50);
desc airport;
insert into Airport Values('PNQ','Pune International Airport','Pune','India');
insert into Airport Values('BOM','Chatrapati Shivaji Maharaj Inernational Airport','Mumbai','India');
insert into Airport Values('DEL','Indira Gandhi International Airport','New Delhi','India');
insert into Airport Values('BLR','Kempegowda International Airport','Bengaluru','India');
insert into Airport Values('HYD','Rajiv Gandhi International Airport','Hydrabd','India');
insert into Airport Values('DXB','Dubai International Airport','Dubai','UAE');
insert into Airport Values('LHR','Heathrow Airport','London','UK');
insert into Airport Values('JFK','John F. Kennedy International Airport','New York','USA');
insert into Airport Values('SIN','Singapore changi Airport','Singapore','Singapore');
insert into Airport Values('SYD','Sydney Kingsford Smith Airport','Sydney','Australia');
INSERT INTO Airport VALUES
('MBA','Chennai International Airport','Chennai','India'),
('FRA','Frankfurt Airport','Frankfurt','Germany'),
('DOH','Hamad International Airport','Doha','Qatar');
INSERT INTO Airport VALUES
('DXN','Noida International Airport (Jewar Airport)','Jewar','India');
INSERT INTO Airport VALUES
('DEN','Noida International Airport','Delhi','India');

select*FROM Airport;
insert into passenger Values(1023,'John Smith',28,'Male','9876543210');
insert into passenger Values(2045,'Emily Johnson',34,'Female','9123456780');
insert into passenger Values(5689,'Sneha Patil',27,'Female','9988776655');
insert into passenger Values(4572,'Arav Sharma',21,'Male','8568905590');
insert into passenger Values(3098,'Michal Brown',32,'Male','9012345678');
insert into passenger Values(6124,'Rahul Verma',30,'Male','8877665544');
insert into passenger Values(7345,'Priya Desai',23,'Female','9876677596');
insert into passenger Values(8465,'Vijay Telange',20,'Male','9561950521');
insert into passenger Values(9231,'Aarya Udamale',20,'Male','7887765010');
insert into passenger Values(9634,'Suyash Wadke',20,'Male','9373270817');
INSERT INTO Passenger VALUES
(1123,'Arjun Mehta',25,'Male','9876543210'),
(2456,'Kavya Nair',22,'Female','9123456780'),
(3789,'Rohit Sharma',30,'Male','9988776655'),
(4012,'Priya Kapoor',28,'Female','9090909090'),
(5234,'Aman Verma',35,'Male','9898989898'),
(6345,'Sneha Iyer',27,'Female','9765432109'),
(7456,'Kunal Singh',24,'Male','9654321098'),
(8567,'Pooja Das',29,'Female','9543210987'),
(9678,'Rahul Jain',31,'Male','9432109876'),
(1789,'Ananya Gupta',26,'Female','9321098765'),
(2890,'Vikram Patil',33,'Male','9210987654'),
(3901,'Meera Shah',23,'Female','9109876543'),
(4123,'Sagar Kulkarni',36,'Male','8998765432'),
(5345,'Nisha Reddy',21,'Female','8887654321'),
(6456,'Aditya Joshi',32,'Male','8776543210'),
(7567,'Riya Choudhary',24,'Female','8665432109'),
(8678,'Manish Yadav',37,'Male','8554321098'),
(9789,'Aditi Mishra',28,'Female','8443210987'),
(1890,'Deepak Pandey',34,'Male','8332109876'),
(2901,'Neha Sinha',22,'Female','8221098765'),
(3012,'Akash Thakur',29,'Male','8110987654'),
(4234,'Swati Patkar',27,'Female','8009876543'),
(5456,'Harsh Vora',31,'Male','7998765432'),
(6678,'Tanvi Deshmukh',26,'Female','7887654321'),
(7890,'Abhishek Roy',35,'Male','7776543210'),
(8901,'Pooja Kulshrestha',23,'Female','7665432109'),
(9123,'Sameer Khan',38,'Male','7554321098'),
(1345,'Isha Malhotra',25,'Female','7443210987'),
(2567,'Rajat Bansal',33,'Male','7332109876'),
(3780,'Kriti Sharma',21,'Female','7221098765'),
(4901,'Mohit Saxena',30,'Male','7110987654'),
(5123,'Ayesha Khan',28,'Female','7009876543'),
(6347,'Nitin Agarwal',36,'Male','6998765432'),
(7569,'Shreya Ghosh',24,'Female','6887654321'),
(8791,'Varun Kapoor',32,'Male','6776543210'),
(9812,'Muskan Jain',27,'Female','6665432109'),
(1034,'Yash Patil',29,'Male','6554321098'),
(2156,'Rutuja Sawant',26,'Female','6443210987'),
(3278,'Siddharth Rao',34,'Male','6332109876'),
(4390,'Komal Gupta',23,'Female','6221098765'),
(5501,'Ajay Kumar',37,'Male','6110987654'),
(6623,'Sonal Verma',25,'Female','6009876543'),
(7745,'Gaurav Singh',31,'Male','5998765432'),
(8867,'Bhavna Patel',28,'Female','5887654321'),
(9989,'Karthik Nair',33,'Male','5776543210'),
(1098,'Divya Iyer',22,'Female','5665432109'),
(2210,'Pratik Shah',35,'Male','5554321098'),
(3321,'Riya Mehta',24,'Female','5443210987'),
(4432,'Ankit Gupta',30,'Male','5332109876'),
(5543,'Simran Kaur',27,'Female','5221098765');
insert into passenger values(4678,'Samarth Lihine',34,'Male','9875330556');

SELECT*FROM p
assenger;
insert into Booking values(4821,1023,'2026-05-03','Confirmed');
insert into Booking values(8955,4678,'2026-05-15','Confirmed');
insert into Booking values(7395,2045,'2026-05-07','Pending');
insert into Booking values(6150,3098,'2026-05-12','pending');
insert into Booking values(9043,4572,'2026-05-01','Confirmed');
insert into Booking values(2589,5689,'2026-05-18','Pending');
insert into Booking values(7741,6124,'2026-05-09','Confirmed');
insert into Booking values(3916,7345,'2026-05-25','Pending');
insert into Booking values(8602,8465,'2026-05-15','Confirmed');
insert into Booking values(5478,9231,'2026-05-21','Confirmed');
insert into Booking values(1209,9634,'2026-05-15','Cancelled');
INSERT INTO Booking VALUES
(7812,1123,'2026-05-02','Confirmed'),
(4921,2456,'2026-05-05','Pending'),
(6354,3789,'2026-05-07','Cancelled'),
(9081,4012,'2026-05-09','Confirmed'),
(2147,5234,'2026-05-11','Confirmed'),
(7765,6345,'2026-05-13','Pending'),
(3982,7456,'2026-05-15','Confirmed'),
(8523,8567,'2026-05-17','Cancelled'),
(1674,9678,'2026-05-19','Confirmed'),
(9032,1789,'2026-05-21','Pending'),
(4412,2890,'2026-05-03','Confirmed'),
(7256,3901,'2026-05-06','Cancelled'),
(3189,4123,'2026-05-08','Confirmed'),
(9901,5345,'2026-05-10','Pending'),
(2745,6456,'2026-05-12','Confirmed'),
(6632,7567,'2026-05-14','Cancelled'),
(8451,8678,'2026-05-16','Confirmed'),
(1120,9789,'2026-05-18','Pending'),
(5567,1890,'2026-05-20','Confirmed'),
(8892,2901,'2026-05-22','Cancelled'),
(3456,3012,'2026-05-04','Confirmed'),
(7689,4234,'2026-05-07','Pending'),
(2198,5456,'2026-05-09','Confirmed'),
(9076,6678,'2026-05-11','Cancelled'),
(4321,7890,'2026-05-13','Confirmed'),
(6543,8901,'2026-05-15','Pending'),
(8765,9123,'2026-05-17','Confirmed'),
(1987,1345,'2026-05-19','Cancelled'),
(7654,2567,'2026-05-21','Confirmed'),
(5432,3780,'2026-05-23','Pending'),
(3210,4901,'2026-05-05','Confirmed'),
(6789,5123,'2026-05-08','Cancelled'),
(9876,6347,'2026-05-10','Confirmed'),
(2345,7569,'2026-05-12','Pending'),
(4567,8791,'2026-05-14','Confirmed'),
(6780,9812,'2026-05-16','Cancelled'),
(8902,1034,'2026-05-18','Confirmed'),
(1122,2156,'2026-05-20','Pending'),
(3344,3278,'2026-05-22','Confirmed'),
(5566,4390,'2026-05-24','Cancelled'),
(7788,5501,'2026-05-06','Confirmed'),
(9900,6623,'2026-05-09','Pending'),
(2233,7745,'2026-05-11','Confirmed'),
(4455,8867,'2026-05-13','Cancelled'),
(6677,9989,'2026-05-15','Confirmed'),
(8899,1098,'2026-05-17','Pending'),
(1010,2210,'2026-05-19','Confirmed'),
(2020,3321,'2026-05-21','Cancelled'),
(3030,4432,'2026-05-23','Confirmed'),
(4040,5543,'2026-05-25','Pending');

select*FROM Booking;
desc flight;
Insert into flight values(101,'Air India Express 101','Mumbai','Dubai','06:30:00');
Insert into flight values(102,'IndiGo 202','Delhi','London','09:15:00');
Insert into flight values(103,'Vistara 303','Bangaluru','Singapore','11:00:00');
Insert into flight values(104,'Emirates 404','Dubai','NewYork','14:45:00');
Insert into flight values(105,'Lufthanasa 505','Frankfurt','Mumbai','17:20:00');
Insert into flight values(106,'IndiGo 606','Pune','Delhi','07:10:00');
Insert into flight values(107,'Air India 707','Chennai','Singapore','22:40:00');
Insert into flight values(108,'Qatar Airways 808','Doha','Bangaluru','13:30:00');
Insert into flight values(109,'British Airways 909','London','Delhi','20:55:00');
Insert into flight values(110,'Singapore Airlines 110','Singapore','Sydaney','12:25:00');
insert into flight values(111,'Air India 111','New Delhi','USA','11:45:00','02:45:00','2026-05-25');
insert into flight values(112,'Indigo 112','Nanded','Chennai','14:46:00','22:47:00');
select*FROM flight;
insert into gate values(1045,'G3',101);
insert into gate values(2389,'G1',102);
insert into gate values(5671,'G5',103);
insert into gate values(9024,'G2',104);
insert into gate values(3158,'G4',105);
insert into gate values(7782,'G1',106);
insert into gate values(6490,'G3',107);
insert into gate values(1206,'G5',108);
insert into gate values(8537,'G2',109);
insert into gate values(4309,'G4',110);
insert into gate values(8561,'G4',111);
select*from gate;
insert into ticket values(4821,1023,106,'12A',5500.00);
insert into ticket values(3688,4678,101,'13C',9500.50);
insert into ticket values(7395,2045,102,'8C',12500.50);
insert into ticket values(6150,3098,108,'5A',28000.00);
insert into ticket values(9043,4572,104,'3A',45000.00);
insert into ticket values(2589,5689,110,'9B',32000.00);
insert into ticket values(7741,6124,105,'7D',38000.00);
insert into ticket values(3916,7345,103,'15B',8200.75);
insert into ticket values(8602,8465,101,'22F',3500.00);
insert into ticket values(5478,9231,107,'10C',9000.90);
insert into ticket values(1209,9634,109,'14D',41000.60);
INSERT INTO Ticket VALUES
(5821,1123,101,'12A',5500.00),
(7392,2456,103,'8C',8200.50),
(6145,3789,105,'15B',12000.75),
(9034,4012,110,'3A',45000.00),
(2580,5234,108,'7D',28000.25),
(7743,6345,106,'22F',3500.00),
(3912,7456,104,'10C',9000.90),
(8605,8567,109,'5A',41000.00),
(5470,9678,102,'14D',12500.60),
(1204,1789,107,'9B',32000.00),
(4823,2890,101,'11A',5400.00),
(7396,3901,103,'6C',8100.00),
(6152,4123,105,'16B',12500.00),
(9048,5345,110,'2A',46000.00),
(2594,6456,108,'8D',27500.00),
(7750,7567,106,'20F',3600.00),
(3928,8678,104,'9C',9200.00),
(8613,9789,109,'4A',40500.00),
(5486,1890,102,'13D',12300.00),
(1215,2901,107,'10B',31500.00),
(4839,3012,101,'14A',5600.00),
(7402,4234,103,'7C',8300.00),
(6168,5456,105,'18B',11900.00),
(9056,6678,110,'1A',47000.00),
(2607,7890,108,'6D',28500.00),
(7764,8901,106,'23F',3400.00),
(3941,9123,104,'11C',9100.00),
(8627,1345,109,'3A',42000.00),
(5499,2567,102,'12D',12700.00),
(1228,3780,107,'8B',31000.00),
(4852,4901,101,'10A',5700.00),
(7415,5123,103,'5C',8000.00),
(6180,6347,105,'17B',11800.00),
(9069,7569,110,'4A',45500.00),
(2621,8791,108,'9D',29000.00),
(7778,9812,106,'21F',3550.00),
(3955,1034,104,'13C',9400.00),
(8640,2156,109,'6A',41500.00),
(5512,3278,102,'15D',12600.00),
(1240,4390,107,'11B',30500.00),
(4866,5501,101,'9A',5800.00),
(7428,6623,103,'4C',8200.00),
(6193,7745,105,'19B',12200.00),
(9083,8867,110,'5A',46000.00),
(2635,9989,108,'10D',29500.00),
(7791,1098,106,'24F',3450.00),
(3968,2210,104,'14C',9300.00),
(8694,3321,109,'7A',42500.00),
(5526,4432,102,'16D',12400.00),
(1254,5543,107,'12B',30000.00);
insert into ticket values(6838,6548,109,'14S',9000.90);
insert into ticket values(4645,9785,104,'19A',5864.67);
insert into ticket values(9567,5654,101,'19B',9994.80);
select*from ticket;
insert into staff values(5832,'Amit Kulkarni','Pilot',120000.60);
insert into staff values(7419,'Neha Sharma','Air Hostess',55000.75);
insert into staff values(2964,'Rahul Patil','Ground Staff',30000.90);
insert into staff values(8305,'Sneha Desai','Security Officer',40000.25);
insert into staff values(1748,'Karan Mehta','Co-Pilot',95000.00);
insert into staff values(6621,'Priya Joshi','Check-in Staff',28000.50);
insert into staff values(9087,'Rohan Gupta','Technician',45000.00);
insert into staff values(4872,'Suresh Jadhav','Bag Handller',25000.00);
insert into staff values(7293,'Pooja Singh','Manager',70000.50);
select*from staff;
SELECT p.Name,b.Booking_id,b.Booking_date,b.Status FROM passenger p join Booking b ON p.passenger_id=b.passenger_id;
SELECT p.Name,b.Booking_id,b.Booking_date,b.Status FROM passenger p join Booking b ON p.passenger_id=b.passenger_id where Status='confirmed';
SELECT p.name, t.ticket_id, t.seat_no, t.price
FROM passenger p
JOIN ticket t
ON p.passenger_id = t.passenger_id;
SELECT 
    p.Name, 
    t.Ticket_ID, 
    t.Seat_No, 
    t.Price,
    b.Status
FROM Passenger p
JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
JOIN Booking b ON p.Passenger_ID = b.Passenger_ID
WHERE b.Status = 'Confirmed';
/*inner Join*/
SELECT p.Name, b.Booking_ID
FROM Passenger p
INNER JOIN Booking b 
ON p.Passenger_ID = b.Passenger_ID;
/*left Join*/
SELECT p.Name, b.Booking_ID
FROM Passenger p
LEFT JOIN Booking b 
ON p.Passenger_ID = b.Passenger_ID;
/*Cross Join*/
SELECT p.Name, f.Flight_Name
FROM Passenger p
CROSS JOIN Flight f;
/*SELF JOIN*/
SELECT A.Staff_Name, B.Staff_Name AS Manager
FROM Staff A, Staff B
WHERE A.Staff_ID = B.Staff_ID;

SELECT 
    p.Name,
    b.Booking_ID,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
JOIN Booking b ON p.Passenger_ID = b.Passenger_ID
JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
JOIN Flight f ON t.Flight_ID = f.Flight_ID
JOIN Gate g ON f.Flight_ID = g.Flight_ID
JOIN Airport a ON f.Source = a.City;
SELECT 
    p.Passenger_ID,
    p.Name,
    b.Booking_ID,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    t.Price AS Ticket_Price,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
LEFT JOIN Ticket t 
    ON p.Passenger_ID = t.Passenger_ID
LEFT JOIN Flight f 
    ON t.Flight_ID = f.Flight_ID
LEFT JOIN Gate g 
    ON f.Flight_ID = g.Flight_ID
LEFT JOIN Airport a 
    ON f.Source = a.City;
    
    SELECT 
    p.Passenger_ID,
    p.Name,
    b.Booking_ID,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    t.Price AS Ticket_Price,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
LEFT JOIN Ticket t 
    ON p.Passenger_ID = t.Passenger_ID
LEFT JOIN Flight f 
    ON t.Flight_ID = f.Flight_ID
LEFT JOIN Gate g 
    ON f.Flight_ID = g.Flight_ID
LEFT JOIN Airport a 
    ON f.Source = a.City WHERE status='confirmed';
    
update ticket SET Ticket_id=8654 Where passenger_id=8465;
update ticket SET Ticket_id=5723 Where passenger_id=1023;
update ticket SET Ticket_id=9542 Where passenger_id=2045;
update ticket SET Ticket_id=3214 Where passenger_id=3098;
update ticket SET Ticket_id=6325 Where passenger_id=4572;
update ticket SET Ticket_id=4563 Where passenger_id=5689;
update ticket SET Ticket_id=1033 Where passenger_id=6124;
update ticket SET Ticket_id=9521 Where passenger_id=7345;
update ticket SET Ticket_id=2314 Where passenger_id=9231;
update ticket SET Ticket_id=8966 Where passenger_id=9634;
update ticket SET flight_id=111 Where passenger_id=4678;
    
    ALter TABLE flight ADD Destination_time time;
    SET SQL_SAFE_UPDATES=0;
    update flight SET Destination_time='09:20:00' where Departure_Time='07:10:00';
    update flight SET Destination_time='02:25:00' where Departure_Time='20:55:00';
    update flight SET Destination_time='04:45:00' where Departure_Time='09:15:00';
    update flight SET Destination_time='16:00:00' where Departure_Time='13:30:00';
    update flight SET Destination_time='06:45:00' where Departure_Time='14:45:00';
    update flight SET Destination_time='14:25:00' where Departure_Time='12:25:00';
    update flight SET Destination_time='21:50:00' where Departure_Time='17:20:00';
    update flight SET Destination_time='13:30:00' where Departure_Time='11:00:00';
    update flight SET Destination_time='05:00:00' where Departure_Time='06:30:00';
    update flight SET Destination_time='01:10:00' where Departure_Time='22:40:00';
    
    SELECT 
    p.Passenger_ID,
    p.Name,
    b.Booking_ID,
    b.Booking_date,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    f.Departure_Time,
    f.Arrival_time,
    t.Price AS Ticket_Price,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
LEFT JOIN Ticket t 
    ON p.Passenger_ID = t.Passenger_ID
LEFT JOIN Flight f 
    ON t.Flight_ID = f.Flight_ID
LEFT JOIN Gate g 
    ON f.Flight_ID = g.Flight_ID
LEFT JOIN Airport a 
    ON f.Source = a.City;
    /*confiemd Ticket Passenger */
    SELECT 
    p.Passenger_ID,
    p.Name,
    b.Booking_ID,
    b.booking_date,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    f.Departure_Time,
    f.Arrival_time,
    t.Price AS Ticket_Price,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
LEFT JOIN Ticket t 
    ON p.Passenger_ID = t.Passenger_ID
LEFT JOIN Flight f 
    ON t.Flight_ID = f.Flight_ID
LEFT JOIN Gate g 
    ON f.Flight_ID = g.Flight_ID
LEFT JOIN Airport a 
    ON f.Source = a.City Where Status='confirmed';
    Alter Table flight RENAME column Destination_time TO Arrival_time;
	ALter TABLE flight ADD Departure_date date;
    SET SQL_SAFE_UPDATES=0;
     update flight SET Departure_date='2026-05-13' where Departure_Time='07:10:00';
     update flight SET Departure_date='2026-05-25' where Departure_Time='20:55:00';
	 update flight SET Departure_date='2026-05-17' where Departure_Time='09:15:00';
    update flight SET Departure_date='2026-05-22' where Departure_Time='13:30:00';
    update flight SET Departure_date='2026-05-11' where Departure_Time='14:45:00';
    update flight SET Departure_date='2026-05-28' where Departure_Time='12:25:00';
    update flight SET Departure_date='2026-05-19' where Departure_Time='17:20:00';
    update flight SET Departure_date='2026-06-05' where Departure_Time='11:00:00';
    update flight SET Departure_date='2026-05-20' where Departure_Time='06:30:00';
    update flight SET Departure_date='2026-06-01' where Departure_Time='22:40:00';
    
    
    SELECT 
    p.Passenger_ID,
    p.Name,
    b.Booking_ID,
    b.Booking_date,
    b.Status,
    t.Ticket_ID,
    t.Seat_No,
    f.Flight_Name,
    f.Source,
    f.Destination,
    b.departure_date,
    f.Departure_Time,
    f.Arrival_time,
    t.Price AS Ticket_Price,
    g.Gate_Number,
    a.Airport_Name
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
LEFT JOIN Ticket t 
    ON p.Passenger_ID = t.Passenger_ID
LEFT JOIN Flight f 
    ON t.Flight_ID = f.Flight_ID
LEFT JOIN Gate g 
    ON f.Flight_ID = g.Flight_ID
LEFT JOIN Airport a 
    ON f.Source = a.City;
    
    ALTER TABLE flight DROP COLUMN departure_date;
    ALTER TABLE booking ADD Departure_Date date;
    UPDATE Booking
SET Departure_Date = DATE_ADD(Booking_Date, INTERVAL 10 DAY);
SET SQL_SAFE_UPDATES=0;
    
    
