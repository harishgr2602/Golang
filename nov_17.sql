SET search_path TO company;

SELECT pnumber, dnum,l_name,address,dob
FROM project,department,employee
WHERE dnum=dnumber AND mgr_ssn = ssn AND plocation = 'Houston';

SELECT E.f_name,E.l_name,S.f_name,S.l_name
FROM employee AS E, employee AS S
WHERE E.super_ssn=S.ssn;

SELECT DISTINCT salary
FROM employee;

SELECT ssn,dname
FROM employee,department;

SELECT * 
FROM employee,department
WHERE dname='Administration' AND dno=dnumber;


SELECT DISTINCT pnumber 
 FROM project, department, employee
 WHERE dnum=dnumber AND mgr_ssn= ssn AND l_name='Smith';

(SELECT DISTINCT pnumber 
 FROM project, department, employee
 WHERE dnum=dnumber AND mgr_ssn= ssn AND l_name='Smith')
 UNION
 (SELECT DISTINCT pnumber 
 FROM project, works_on, employee
 WHERE pnumber=pno AND essn=ssn AND l_name='Smith');

SELECT f_name,l_name
 FROM employee
 WHERE NOT EXISTS(SELECT * FROM dependent WHERE ssn= essn);

SELECT f_name,l_name
 FROM employee
 WHERE EXISTS(SELECT * FROM dependent WHERE ssn= essn);
 
 SELECT f_name, l_name
 FROM employee
 WHERE EXISTS (SELECT * FROM dependent WHERE ssn=essn AND EXISTS(SELECT * FROM department));
  
 SELECT f_name, l_name
 FROM employee
 WHERE EXISTS (SELECT * FROM dependent WHERE ssn=essn)
 AND EXISTS(SELECT * FROM department WHERE ssn=mgr_ssn);
 
 SELECT ssn, f_name 
 FROM employee
 WHERE address LIKE '%Houston%';

SELECT f_name,ssn
 FROM employee 
 WHERE f_name LIKE '_____';

SELECT * FROM employee WHERE(salary BETWEEN 30000 AND 40000);

SELECT E.f_name,E.l_name, 1.2 * E.salary AS Increased_sal
 FROM employee AS E, works_on AS W, project AS P
 WHERE E.ssn = W.essn AND W.pno=P.pnumber AND P.pname='ProductY';
 
 SELECT *
 FROM employee WHERE super_ssn IS NULL;
 
 SELECT SUM(salary),MIN(salary), MAX(salary) FROM employee;
 
 SELECT COUNT(DISTINCT salary) FROM employee;
 
 SELECT D.dname, E.l_name,E.f_name,P.pname
 FROM department AS D, employee AS E,works_on AS W, project AS P
 WHERE D.dnumber = E.dno AND E.ssn = W.essn AND W.pno = P.pnumber ORDER BY D.dname, E.l_name, E.f_name;

SELECT * FROM employee ORDER BY salary DESC;

SELECT * FROM works_on OFFSET 5 LIMIT 3;

SELECT * FROM works_on FETCH FIRST 8 ROWS ONLY;

//CREATING AN VIEW

CREATE VIEW works_on1
AS SELECT f_name, l_name, pname
FROM employee,project, works_on
WHERE ssn=essn AND pno=pnumber;

SELECT * FROM works_on1;

CREATE TABLE tabl1(tblid int);
CREATE TABLE tabl2(tblid int);

//CREATING AN PROCEDURE

CREATE PROCEDURE insert_value(x integer, y integer)
LANGUAGE SQL
AS $$
INSERT INTO tabl1 VALUES(x);
INSERT INTO tabl2 VALUES(y);
$$;

CALL insert_value(1,2);
CALL insert_value(3,4);

SELECT * FROM tabl1;
SELECT * FROM tabl2;

//CREATING TRIGGERS

CREATE TABLE audit(emp_id char(9)NOT NULL,entrydate TEXT NOT NULL);

CREATE OR REPLACE FUNCTION audit_log_func() RETURNS TRIGGER AS $example_table$
BEGIN
INSERT INTO audit(emp_id,entrydate) VALUES(NEW.ssn ,current_timestamp);
RETURN NEW;
END;
$example_table$ LANGUAGE plpgsql;
CREATE TRIGGER example_trigger AFTER INSERT ON employee FOR EACH ROW EXECUTE PROCEDURE audit_log_func();

INSERT INTO employee VALUES('Parkavi','R','Ramesh','123478965','1987-07-27','898 Selinum,Houston,TX','F','40000','333445555','5');

SELECT * FROM audit;

GRANT SELECT ON tabl1 TO PUBLIC;

GRANT INSERT ON employee TO PUBLIC;

REVOKE INSERT ON employee FROM PUBLIC;

SELECT * FROM tabl1;

INSERT INTO tabl1 VALUES('2');
INSERT INTO tabl1 VALUES('4');
INSERT INTO tabl1 VALUES('5');
INSERT INTO tabl1 VALUES('6');
INSERT INTO tabl1 VALUES('7');
INSERT INTO tabl1 VALUES('8');
INSERT INTO tabl1 VALUES('9');
INSERT INTO tabl1 VALUES('10');

BEGIN;
DELETE FROM tabl1 WHERE tblid > '5';
COMMIT;

//Analytical or window function

CREATE TABLE product_groups(
group_id SERIAL PRIMARY KEY,
group_name VARCHAR(255) NOT NULL);

CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
price DECIMAL(11,2),
group_id INT NOT NULL,
FOREIGN KEY(group_id) REFERENCES product_groups(group_id));

INSERT INTO product_groups(group_name) VALUES('Smartphone'),('Laptop'),('Tablet');

INSERT INTO products (product_name,product_id,price) VALUES
('Microsoft Lumia',1,2000),
('MI one',1,4000),
('Nexus',1,5000),
('iphone',1,9000),
('MF Elite',2,12000),
('Lenovo Thinkpad',2,7000),
('Sony VAIO',2,7000),
('DELL Vestro',2,8000),
('ipad',3,7000),
('Kindle palate',3,1500),
('Samsung Galaxy Tab',3,2000);

SELECT * FROM prod;

CREATE TABLESPACE dvdrental1 LOCATION 'C:\pg\data\dvdrental1';

ALTER TABLESPACE dvdrental1 RENAME TO dvdrent1;

DROP TABLESPACE dvdrent1;