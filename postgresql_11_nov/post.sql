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