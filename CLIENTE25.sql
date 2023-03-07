CREATE DATABASE CLIENTE25
USE CLIENTE25

SELECT *
FROM Customer

select customer_id,account_num,upper(lname) as lname,upper(fname) as fname ,upper(address) as address,upper(city) as city,
upper(state_province) as state_province,postal_code,upper(country) as country,customer_region_id,phone,
upper(marital_status) as marital_status, upper(gender) as gender,total_children,num_children_at_home,upper(education) as education,
upper(member_card) as member_card,age,year_income,expense
FROM Customer

update Customer
set 
lname=upper(lname),
fname=upper(fname),
address=upper(address),
city=upper(city),
state_province=upper(state_province),
country=upper(country),
education=upper(education),
member_card=upper(member_card),
marital_status=upper(marital_status),
gender=upper(gender)

update Customer
set 
lname=lower(lname),
fname=lower(fname),
address=lower(address),
city=lower(city),
state_province=lower(state_province),
country=lower(country),
education=lower(education),
member_card=lower(member_card),
marital_status=lower(marital_status),
gender=lower(gender)

select upper(lname),upper(fname),upper(address),upper(city),
upper(state_province),upper(country),upper(education),upper(member_card),upper(marital_status),upper(gender)
from Customer

select reverse(replace((replace((replace((replace((replace((lname),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((fname),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((address),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((city),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((state_province),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((country),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((education),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer
select reverse(replace((replace((replace((replace((replace((member_card),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))
from Customer

update Customer
set
lname=reverse(replace((replace((replace((replace((replace((lname),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
fname=reverse(replace((replace((replace((replace((replace((fname),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
address=reverse(replace((replace((replace((replace((replace((address),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
city=reverse(replace((replace((replace((replace((replace((city),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
state_province=reverse(replace((replace((replace((replace((replace((state_province),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
country=reverse(replace((replace((replace((replace((replace((country),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
education=reverse(replace((replace((replace((replace((replace((education),'u','$')),'o','%')),'i','&')),'A','*')),'E','/')),
member_card=reverse(replace((replace((replace((replace((replace((member_card),'u','$')),'o','%')),'i','&')),'A','*')),'E','/'))

update Customer
set
lname=reverse(replace((replace((replace((replace((replace((lname),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
fname=reverse(replace((replace((replace((replace((replace((fname),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
address=reverse(replace((replace((replace((replace((replace((address),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
city=reverse(replace((replace((replace((replace((replace((city),'$','U')),'%','U')),'&','I')),'*','A')),'/','E')),
state_province=reverse(replace((replace((replace((replace((replace((state_province),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
country=reverse(replace((replace((replace((replace((replace((country),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
education=reverse(replace((replace((replace((replace((replace((education),'$','U')),'%','O')),'&','I')),'*','A')),'/','E')),
member_card=reverse(replace((replace((replace((replace((replace((member_card),'%','U')),'%','O')),'&','I')),'*','A')),'/','E'))

