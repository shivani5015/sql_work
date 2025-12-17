use world;
show tables;
describe country;
select * from country;
 
 -- function
 -- string: concat
 select Name , Continent ,concat(name, ' ' , Continent) as new_name from country;
 
 -- concate_ws
 select Name ,  Region ,concat_ws('-',name,population) from country;
 -- substr or substring
 select Name , Continent , substr(name,1) ,substr(Continent,2,5) from country;
 
 -- negative index
 select Name, Continent,Region, substr(name,-2) , substr(Region,-4) from country;
 
 select Name , Continent  from country where substr(Name,1,3)='ALG';
 
 -- instr : -> search position of character
 select name ,instr( name,'e') from country;
 
 -- length :( used byte)
  select Name, length(name) from country;
  
 -- char_length
   select Name, char_length(name) from country;
   
  -- trim ,ltrim ,rtrim
select Name, trim(both'a' from name) from country;

-- lpad rpad
select name , Population, lpad(Population ,9 ,'#') from country;








