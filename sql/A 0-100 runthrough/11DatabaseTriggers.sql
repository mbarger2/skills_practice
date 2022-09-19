-- DATABASE TRIGGERS

-- example of use 1:  making restraints on data to prevent insertion into data (ie when age<18)
-- example of use 2: updating stats when a follow is deleted

-- EXAMPLE OF SYNTAX
-- CREATE TRIGGER trigger_name trigger_time trigger_event
-- ON table_name FOR EACH ROW 
-- BEGIN
-- ...
-- END;

-- trigger_time: 'BEFORE', 'AFTER'
-- trigger_event: 'INSERT', 'UPDATE', 'DELETE'

-- SET UP
CREATE DATABASE trigger_demo;
use trigger_demo;
CREATE TABLE users(
	username varchar(100),
    age int
    );
desc users;
INSERT INTO users(username, age) values('Bobby',23);
INSERT INTO users(username, age) values('Britney',16);
select * from users;
-- EXAMPLE 1 preventing non-adults from joing database
DELIMITER $$

CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age < 18  -- to retroactively affect data, can use OLD.age <18
        THEN
			SIGNAL SQLSTATE '45000'  -- code to communicate to MySQL
					SET MESSAGE_TEXT = 'Must be an adult!'; -- code to communicate to user
		END IF;
	END;
$$

DELIMITER ;

-- 45000 is "A generic state representing unhandled user-defined exception". b
-- basically a blank error state that I get to edit
-- DELIMITER $$ $$ DELIMITER ; allows several potential exits in code aka multiple ';'
-- means when code runs the entire block, multiple semicolons and all, will run together

INSERT INTO users(username, age) values('Sue',54);
INSERT INTO users(username, age) values('Yang',14);
select * from users;

 
-- EXAMPLE 2 preventing self-follows
DELIMITER $$

create trigger no_self_follows
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.follower_id = NEW.followee_id  -- to retroactively affect data, can use OLD.age <18
        THEN
			SIGNAL SQLSTATE '45000'  -- code to communicate to MySQL
					SET MESSAGE_TEXT = 'Cannot follow yourself'; -- code to communicate to user
		END IF;
	END;
$$ DELIMITER ;


-- EXAMPLE 3
-- requires creation of new table 'unfollows' to record data
DELIMITER $$
create trigger track_unfollows
	AFTER DELETE on follows FOR EACH ROW
    BEGIN
	-- set follower_id == OLD.follower_id,
	-- followee_id = OLD.followee_id;
		INSERT INTO unfollows(follower_id, followee_id) 
        values(old.follower_id, OLD.followee_id);
	END;
$$ DELIMITER ;

