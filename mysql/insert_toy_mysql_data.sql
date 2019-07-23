/*
### table 1  : exchange_rates
*/
drop table if exists exchange_rates;
create table exchange_rates(
ts timestamp ,
from_currency varchar(3),
to_currency varchar(3),
rate numeric
);
truncate table exchange_rates;
insert into exchange_rates
values
('2018-04-01 00:00:00', 'USD', 'GBP', '0.71'),
('2018-04-01 00:00:05', 'USD', 'GBP', '0.82'),
('2018-04-01 00:01:00', 'USD', 'GBP', '0.92'),
('2018-04-01 01:02:00', 'USD', 'GBP', '0.62'),
('2018-04-01 02:00:00', 'USD', 'GBP', '0.71'),
('2018-04-01 03:00:05', 'USD', 'GBP', '0.82'),
('2018-04-01 04:01:00', 'USD', 'GBP', '0.92'),
('2018-04-01 04:22:00', 'USD', 'GBP', '0.62'),
('2018-04-01 00:00:00', 'EUR', 'GBP', '1.71'),
('2018-04-01 01:00:05', 'EUR', 'GBP', '1.82'),
('2018-04-01 01:01:00', 'EUR', 'GBP', '1.92'),
('2018-04-01 01:02:00', 'EUR', 'GBP', '1.62'),
('2018-04-01 02:00:00', 'EUR', 'GBP', '1.71'),
('2018-04-01 03:00:05', 'EUR', 'GBP', '1.82'),
('2018-04-01 04:01:00', 'EUR', 'GBP', '1.92'),
('2018-04-01 05:22:00', 'EUR', 'GBP', '1.62'),
('2018-04-01 05:22:00', 'EUR', 'HUF', '0.062')
;

/*
### table 2 :  transactions
*/
drop table if exists transactions;
create table transactions (
ts timestamp,
user_id int,
currency varchar(3),
amount numeric
);
truncate table transactions;
insert into transactions
values
('2018-04-01 00:00:00', 1, 'EUR', 2.45),
('2018-04-01 01:00:00', 1, 'EUR', 8.45),
('2018-04-01 01:30:00', 1, 'USD', 3.5),
('2018-04-01 20:00:00', 1, 'EUR', 2.45),
('2018-04-01 00:30:00', 2, 'USD', 2.45),
('2018-04-01 01:20:00', 2, 'USD', 0.45),
('2018-04-01 01:40:00', 2, 'USD', 33.5),
('2018-04-01 18:00:00', 2, 'EUR', 12.45),
('2018-04-01 18:01:00', 3, 'GBP', 2),
('2018-04-01 00:01:00', 4, 'USD', 2),
('2018-04-01 00:01:00', 4, 'GBP', 2)
;

/*
### table 3 : Trips 
*/
Create table If Not Exists Trips (Id int, Client_Id int, Driver_Id int, City_Id int, Status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'), Request_at varchar(50)); 
Truncate table Trips;
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01'); 
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01'); 
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03'); 

/*
### table 4 : Users
*/
Create table If Not Exists Users (Users_Id int, Banned varchar(50), Role ENUM('client', 'driver', 'partner'));
Truncate table Users;
insert into Users (Users_Id, Banned, Role) values ('1', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('2', 'Yes', 'client');
insert into Users (Users_Id, Banned, Role) values ('3', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('4', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('10', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('11', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('12', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('13', 'No', 'driver'); 