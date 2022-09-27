-- Procedure Practice
DELIMITER //
CREATE or REPLACE procedure pr_name (p_name varchar(55), p_age int)
as 
declare var_name decimal;
variable;
begin procedure body - all logics
end
// DELIMITER ;

-- Practice 1
use tv_app;
DELIMITER //
CREATE  PROCEDURE tvshows()
BEGIN
    select title, released_year,genre from series;
END //
    
DELIMITER ;
call tvshows();