use stockanalysis;

-- EDA --
-- basic queries on tcs stock
## checking tcs dataset 
select count(*) from tcs;
desc tcs;
select * from tcs;
select sum(`Total Turnover (Rs.)`) from tcs;

## checking infosys dataset
select count(*) from infosys;
desc infosys;
select * from infosys;
select sum(`Total Turnover (Rs.)`) from infosys;

## checking tvs motors dataset
select count(*) from `tvs motors`;
desc `tvs motors`;
select * from `tvs motors`;
select sum(`Total Turnover (Rs.)`) from `tvs motors`;

## checking bajaj auto dataset
select count(*) from `bajaj auto`;
desc `bajaj auto`;
select * from `hero motocorp`;
select sum(`Total Turnover (Rs.)`) from `bajaj auto`;

## checking eicher motors dataset
select count(*) from `eicher motors`;
desc `eicher motors`;
select * from `eicher motors`;
select sum(`Total Turnover (Rs.)`) from `eicher motors`;

## checking hero motocorp dataset
select count(*) from `hero motocorp`;
desc `hero motocorp`;
select * from `hero motocorp`;
select sum(`Total Turnover (Rs.)`) from `hero motocorp`;

## creating new tables for each stock
create table bajaj1(
	`date` date,
    `close_date` decimal(10,2),
    `ma20` decimal(10,2),
    `ma50` decimal(10,2),
    `row_no` integer
);

create table eicher1 like bajaj1;
create table hero1 like bajaj1;
create table infosys1 like bajaj1;
create table tcs1 like bajaj1;
create table tvs1 like bajaj1;

-- altering column name 
alter table eicher1 rename column `close_date` to `close_price`;
alter table bajaj1 rename column `close_date` to `close_price`;
alter table hero1 rename column `close_date` to `close_price`;
alter table tcs1 rename column `close_date` to `close_price`;
alter table infosys1 rename column `close_date` to `close_price`;
alter table tvs1 rename column `close_date` to `close_price`;

desc eicher1;
-- inserting values into the newly created table for calculating 20 days moving average and 50 days moving average

## for bajaj auto dataset
insert into bajaj1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `bajaj auto`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update bajaj1
set ma20 = NULL
where
   row_no < 20; 
  
update bajaj1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table bajaj1
drop column row_no;


## for eicher motors dataset
insert into eicher1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `eicher motors`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update eicher1
set ma20 = NULL
where
   row_no < 20; 
  
update eicher1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table eicher1
drop column row_no;


## for hero motocorp dataset
insert into hero1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `hero motocorp`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update hero1
set ma20 = NULL
where
   row_no < 20; 
  
update hero1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table hero1
drop column row_no;


## for infosys dataset
insert into infosys1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `infosys`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update infosys1
set ma20 = NULL
where
   row_no < 20; 
  
update infosys1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table infosys1
drop column row_no;


## for tcs dataset
insert into tcs1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `tcs`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update tcs1
set ma20 = NULL
where
   row_no < 20; 
  
update tcs1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table tcs1
drop column row_no;


## for tvs motors dataset
insert into tvs1 (Date, close_price, ma20, ma50, row_no)
select
    STR_TO_DATE(`Date`, '%e-%M-%Y') as Date,
    `Close Price`,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 19 preceding) as ma20,
    AVG(`Close Price`) over (order by STR_TO_DATE(`Date`, '%e-%M-%Y') asc rows 49 preceding) as ma50,
    ROW_NUMBER() over (order by STR_TO_DATE(`Date`, '%e-%M-%Y')) AS row_no
FROM `tvs motors`
order by STR_TO_DATE(`Date`, '%e-%M-%Y');

-- Removing the avg values calculated for the 1st 20 rows in ma20 and for 1st 50 rows in ma50
update tvs1
set ma20 = NULL
where
   row_no < 20; 
  
update tvs1
set ma50 = NULL
where
   row_no < 50; 

-- We no longer require the column with row numbers so lets drop it
alter table tvs1
drop column row_no;

-- view values inserted into the new table

select * from bajaj1;
select * from eicher1;
select * from hero1;
select * from infosys1;
select * from tcs1;
select * from tvs1;


-- creating table for displaying closing values of all the stocks

create table close_stock as 
( select date,b.close_price as 'Bajaj',t.close_price as 'TCS',v.close_price as 'TVS',i.close_price as 'Infosys', e.close_price as 'Eicher',h.close_price as 'Hero'
from bajaj1 b inner join eicher1 e using(date)
 inner join hero1 h using(date)
 inner join infosys1 i using(date)
 inner join tcs1 t using(date)
 inner join tvs1 v using(date));
 
 select * from close_stock;
 
 ## creating view for signal information (when to buy, hold or sell stocks)
 ## crossing point ma20>ma50 then buy if ma20 < ma50 then sell else hold
 -- creating for bajaj
 
create view raw_file1 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from bajaj1;

create table bajaj2
(select Date,Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file1);


# Creating eicher2

create view raw_file2 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from eicher1;

create table eicher2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file2);

# Creating hero2
create view raw_file3 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from hero1;

create table hero2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file3);

# Creating infosys2
create view raw_file4 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from infosys1;

create table infosys2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file4);

# Creating tcs2
create view raw_file5 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from tcs1;

create table tcs2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file5);

# Creating TVS2
create view raw_file6 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from tvs1;

create table tvs2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when ma20 > ma50 and (lag(ma20,1) over (order by date)) < (lag(ma50,1) over (order by date)) 
				then 'Buy'
	when ma20 < ma50 and (lag(ma20,1) over (order by date)) > (lag(ma50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file6);

### Getting Glimpse of all the newly created signal tables

select * from bajaj2;
select * from eicher2;
select * from infosys2;
select * from hero2;
select * from tcs2;
select * from tvs2;

### creating function to check the status of the stock 
## Function should take 'date' as input and returns the signal(Buy/Sell/Hold) for that particular day

delimiter $$

create function signal_bajaj (d date)
returns varchar(15) deterministic
begin 
	declare Trade_Signal varchar(15);
    select `Signal` 
    from bajaj2 
    where date=d into Trade_Signal;
	return Trade_Signal ;
  end
  
$$ delimiter ;

-- Sample query to generate a signal
select signal_bajaj('2017-12-21') as Trade_signal;


## Queries used to help in drawing the Inferences from the stock analysis

-- For Bajaj

select date, close_price
from bajaj2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from bajaj2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For Eicher

select date, close_price
from eicher2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from eicher2
where `signal` = 'Sell'
order by close_price desc
limit 1;

-- For Hero

select date, close_price
from hero2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from hero2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For Infosys 

select date, close_price
from infosys2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from infosys2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For TCS 

select date, close_price
from tcs2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from tcs2
where `signal` = 'Sell'
order by close_price desc
limit 1;

-- For TVS 

select date, close_price
from tvs2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from tvs2
where `signal` = 'Sell'
order by close_price desc
limit 1;
    
