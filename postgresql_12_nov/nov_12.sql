CREATE SCHEMA company;

SET search_path TO company;

CREATE TABLE employee(
f_name TEXT NOT NULL,
	m_name CHAR NULL,
	l_name TEXT NOT NULL,
	ssn CHAR(9) NOT NULL PRIMARY KEY,
	dob DATE,
	address TEXT NOT NULL,
	gender CHAR NULL, 
	salary DECIMAL(10,2) NULL,
	super_ssn CHAR(9) NULL,
	dno INT NOT NULL);
	
CREATE TABLE department(
dname TEXT NOT NULL,
dnumber INT NOT NULL PRIMARY KEY,
mgr_ssn CHAR(9) NOT NULL,
mgr_start_date DATE NULL);

CREATE TABLE dept_locations(
dnumber INT NOT NULL,
dlocation TEXT NOT NULL,
PRIMARY KEY(dnumber, dlocation));

CREATE TABLE project(
pname TEXT NOT NULL,
pnumber INT NOT NULL,
plocation TEXT,
dnum INT NOT NULL,
PRIMARY KEY(pnumber),
UNIQUE(pname));

CREATE TABLE works_on(
essn CHAR(9) NOT NULL,
pno INT NOT NULL,
hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY(essn, pno));

CREATE TABLE dependent(
essn CHAR(9) NOT NULL,
dependent_name TEXT NOT NULL,
sex CHAR,
dob DATE,
relationship TEXT,
PRIMARY KEY(essn, dependent_name));

	
INSERT INTO employee VALUES('Jhon','8','Smith','123456789','1965-01-09','731 Fondren,Houston,TX','M','30000','333445555','5');
INSERT INTO department VALUES('Research','5','333445555','1988-05-22');
INSERT INTO dependent VALUES('333445555','Theodre','M','1983-10-25','Son');
INSERT INTO dept_locations VALUES('1','Houston');
INSERT INTO project VALUES('ProductX','1','Bellaire','5');
INSERT INTO works_on VALUES('123456789','1','32.5');

INSERT INTO employee VALUES('Franklin','T','Wong','333445555','1955-12-08','638 Voss,Houston,TX','M','40000','888995555','5');
INSERT INTO department VALUES('Administration','4','987654321','1995-01-01');
INSERT INTO dependent VALUES('333445555','Alice','F','1986-04-05','Daughter');
INSERT INTO dept_locations VALUES('4','Stafford');
INSERT INTO project VALUES('ProductY','2','Sugarland','5');
INSERT INTO works_on VALUES('123456789','2','7.5');

INSERT INTO works_on (essn,pno, hours) VALUES('453453453','2','25');

INSERT INTO employee VALUES('Alica','J','Zelaya','999887777','1968-01-19','3321 Castle,Springs,TX','F','25000','987654321','4');
INSERT INTO employee VALUES('Jennifer','S','Wallace','987654321','1941-06-20','281 Berraie,Belair,TX','F','43000','888665555','4');
INSERT INTO employee VALUES('Ramesh','K','Narayanan','666884444','1962-09-15','975 Fire oak,Humble,TX','M','38000','333445555','5');
INSERT INTO employee VALUES('Joyce','A','English','453453453','1972-07-31','5631 Rice,Houston,TX','M','25000','333445555','5');
INSERT INTO employee VALUES('Ahmad','V','jaffer','98987897','1969-03-29','980 Dallas,Houston,TX','M','25000','987654321','4');
INSERT INTO employee VALUES('James','E','Borg','888665555','1937-11-10','450 Stone,Houston,TX','M','55000',NULL,'1');

SELECT * FROM employee;

INSERT INTO department VALUES('Headquaters','1','888665555','1981-06-19');

SELECT * FROM department;

INSERT INTO dependent VALUES('333445555','Joy','F','1958-05-03','Spouse');
INSERT INTO dependent VALUES('987654321','Abner','M','1942-02-28','Spouse');
INSERT INTO dependent VALUES('123456789','Michale','M','1988-01-04','Son');
INSERT INTO dependent VALUES('123456789','Alice','F','1988-12-30','Daughter');
INSERT INTO dependent VALUES('123456789','Elizebeth','F','1967-05-05','Spouse');

SELECT * FROM dependent;

INSERT INTO dept_locations VALUES('5','Bellalire');
INSERT INTO dept_locations VALUES('5','Sugarland');
INSERT INTO dept_locations VALUES('5','Houston');

SELECT * FROM dept_locations;

INSERT INTO project VALUES('ProductZ','3','Houston','5');
INSERT INTO project VALUES('Computerization','10','Stafford','4');
INSERT INTO project VALUES('Reorganization','20','Houston','1');
INSERT INTO project VALUES('Newbenefits','30','Stafford','4');

SELECT * FROM project;

INSERT INTO works_on VALUES('666884444','3','40.0');
INSERT INTO works_on VALUES('453453453','1','20.0');
INSERT INTO works_on VALUES('333445555','2','10.0');
INSERT INTO works_on VALUES('333445555','3','10.0');
INSERT INTO works_on VALUES('333445555','10','10.0');
INSERT INTO works_on VALUES('333445555','20','10.0');
INSERT INTO works_on VALUES('333445555','30','30.0');
INSERT INTO works_on VALUES('999887777','10','10.0');
INSERT INTO works_on VALUES('987987987','30','5.0');
INSERT INTO works_on VALUES('987654321','30','20.0');
INSERT INTO works_on VALUES('987654321','20','15.0');
INSERT INTO works_on VALUES('888665555','20','10.0');

SELECT * FROM works_on;

ALTER TABLE department ADD FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn);
ALTER TABLE employee ADD FOREIGN KEY (super_ssn) REFERENCES employee(ssn);
ALTER TABLE employee ADD FOREIGN KEY (dno) REFERENCES department(dnumber);
ALTER TABLE dept_locations ADD FOREIGN KEY (dnumber) REFERENCES department(dnumber);
ALTER TABLE project ADD FOREIGN KEY (dnum) REFERENCES department(dnumber);
ALTER TABLE works_on ADD FOREIGN KEY (essn) REFERENCES employee(ssn);
ALTER TABLE works_on ADD FOREIGN KEY (pno) REFERENCES project(pnumber);
ALTER TABLE dependent ADD FOREIGN KEY (essn) REFERENCES employee(ssn);

UPDATE employee SET ssn='888995555' WHERE l_name='Borg';

SELECT f_name, l_name, address
FROM employee
WHERE dno='5';

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

//DCL
GRANT SELECT ON tabl1 TO PUBLIC;

GRANT INSERT ON employee TO PUBLIC;

REVOKE INSERT ON employee FROM PUBLIC;

//TCL

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

//UUID

SELECT * FROM pg_available_extensions;

CREATE EXTENSION IF NOT EXISTS "uuid-oosp";