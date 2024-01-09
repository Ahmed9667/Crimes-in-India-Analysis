#3.1Insert records from 42_District_wise_crimes_committed_against_women_2001_2012.csv into a table
use crimes ;
SELECT * FROM crimes.`crimes against women`;

#3.2Write SQL query to find the highest number of rapes & Kidnappings that happened in which state, District, and year
SET sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));


#select the maximun rape crimes in which state and distrct and year
select STATE_UT , DISTRICT, years , Rape from crimes.`crimes against women`
where Rape = (select max(Rape) from crimes.`crimes against women`);

#select the maximun kidnappings crimes in which state and distrct and year
select STATE_UT, DISTRICT , years ,Kidnapping_and_Abduction 
from crimes.`crimes against women`
where
Kidnapping_and_Abduction = (select max(Kidnapping_and_Abduction) from crimes.`crimes against women`);


#3.3Write SQL query to find All the lowest number of rapes & Kidnappings that happened in which state, District, and year
#select the minimum rape crimes in which state and distrct and year
select STATE_UT , DISTRICT, years , Rape from crimes.`crimes against women`
where Rape = (select min(Rape) from crimes.`crimes against women`);

#select the minimum kidnapping crimes in which state and distrct and year
select STATE_UT, DISTRICT , years ,Kidnapping_and_Abduction 
from crimes.`crimes against women`
where
Kidnapping_and_Abduction = (select min(Kidnapping_and_Abduction) from crimes.`crimes against women`);



#3.4Insert records from 02_District_wise_crimes_committed_against_ST_2001_2012.csv into a new table
SELECT * FROM crimes.`crimes against st`;

#3.5Write SQL query to find the highest number of dacoity/robbery in which district

#find the highest number of dacoity
select DISTRICT , Dacoity  from crimes.`crimes against st`
where Dacoity = (select max(Dacoity) from crimes.`crimes against st`);

#find the highest number of Robbery
select DISTRICT , Robbery as 'max_robbery' from crimes.`crimes against st`
where Robbery = (select max(Robbery) from crimes.`crimes against st`);


#3.6Write SQL query to find in which districts(All) the lowest number of murders happened
select DISTRICT , min(Murder) as 'min_murder_crimes' from crimes.`crimes against st`
group by DISTRICT ;


#3.7Write SQL query to find the number of murders in ascending order in district and yearwise
select DISTRICT , Years , Murder from crimes.`crimes against st`
order by Murder asc ;

#3.8.1	Insert records of STATE/UT, DISTRICT, YEAR, MURDER, ATTEMPT TO MURDER, and RAPE columns only from 01_District_wise_crimes_committed_IPC_2001_2012.csv into a new table
create table IPC_Crimes(STATE varchar(200) ,
DISTRICT varchar(200),
years varchar(200),
MURDER int,
ATTEMP_TO_MURDER int ,
RAPE int);
select * from IPC_Crimes;


#3.8.2Write SQL query to find which District in each state/ut has the highest number of murders yearwise. Your output should show STATE/UT, YEAR, DISTRICT, and MURDERS.
use crimes ;
select STATE ,DISTRICT ,years, max(MURDER) as max_murder from IPC_Crimes
Group by MURDER;

select STATE  ,years, max(MURDER) as max_murder from IPC_Crimes
Group by STATE , years
order by years ;



