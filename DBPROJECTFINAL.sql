 CREATE TABLE PERSON
( 
  Personal_id     VARCHAR2(9)          NOT NULL,
  Lname           VARCHAR2(10)   NOT NULL,
  Fname           VARCHAR2(10)   NOT NULL,
  Gender          VARCHAR2(1),
  Age             NUMBER,
  Address_1       VARCHAR2(30),
  Address_2       VARCHAR2(30),
  City            VARCHAR2(10),
  State           VARCHAR2(10),
  Zipcode         NUMBER,
  Employee_flag   NUMBER(1),
  Super_id        VARCHAR2(9),
  Title           VARCHAR2(30),
  Rank            VARCHAR2(30),
  Potential_flag  NUMBER(1),
  Customer_flag   NUMBER(1),
  Pref_salesmen   VARCHAR2(20),
  Candidate_flag  NUMBER(1),
PRIMARY KEY   (Personal_id),
FOREIGN KEY(Super_id) REFERENCES PERSON(Personal_id));

CREATE TABLE PHONE_NUMBERS
(
  Personal_id   VARCHAR2(9)     NOT NULL,
  Phone_no      VARCHAR2(10)    NOT NULL,
PRIMARY KEY (Personal_id, Phone_no),
FOREIGN KEY(Personal_id) REFERENCES PERSON(Personal_id));

CREATE TABLE SALARY
(
  Personal_id       VARCHAR2(9) NOT NULL,
  Transaction_no    NUMBER      NOT NULL,
  Pay_date          DATE,
  Amount            NUMBER,
PRIMARY KEY(Personal_id, Transaction_no),
FOREIGN KEY(Personal_id) REFERENCES PERSON(Personal_id));

CREATE TABLE DEPARTMENT
(
  Dep_id      NUMBER      NOT NULL,
  D_name    VARCHAR(20) NOT NULL,
PRIMARY KEY(Dep_id),
UNIQUE(D_name));
  
CREATE TABLE WORKS_FOR
(
  Personal_id       VARCHAR2(9) NOT NULL,
  Dep_id              NUMBER      NOT NULL,
  Start_time        TIMESTAMP		NOT NULL,
  End_time          TIMESTAMP,
PRIMARY KEY(Personal_id, Dep_id, Start_time),
FOREIGN KEY(Personal_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Dep_id) REFERENCES DEPARTMENT(Dep_id));

CREATE TABLE JOB
(
  Job_id        NUMBER  NOT NULL,
  Dep_id        NUMBER  NOT NULL,
  Job_date      DATE,
  Description   VARCHAR(150),
PRIMARY KEY(Job_id),
FOREIGN KEY(Dep_id) REFERENCES DEPARTMENT(Dep_id));

CREATE TABLE APPLIES_TO
(
  Candidate_id  VARCHAR(9)  NOT NULL,
  Job_id        NUMBER      NOT NULL,
PRIMARY KEY(Candidate_id, Job_id),
FOREIGN KEY(Candidate_id) REFERENCES PERSON(Personal_id));

CREATE TABLE INTERVIEW
(
  Candidate_id      VARCHAR(9)  NOT NULL,
  Employee_id       VARCHAR(9)  NOT NULL,
  Job_id            NUMBER      NOT NULL,
  Round             NUMBER      NOT NULL,
  Grade             NUMBER,
  Interview_time    TIMESTAMP,
PRIMARY KEY(Candidate_id, Employee_id, Job_id, Round),
FOREIGN KEY(Candidate_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Employee_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Job_id) REFERENCES JOB(Job_id));

CREATE TABLE INTERVIEW_EMAIL
(
    Candidate_id    	VARCHAR2(9)     NOT NULL,
    Email          		 VARCHAR2(50),
PRIMARY KEY(Candidate_id),
FOREIGN KEY(Candidate_id) REFERENCES PERSON(Personal_id));

CREATE TABLE SITE
(
  Site_id       NUMBER          NOT NULL,
  Site_name     VARCHAR(20)     NOT NULL,
  Site_location VARCHAR(50),
PRIMARY KEY(Site_id));

CREATE TABLE SITE_EMPLOYEE
(
  Employee_id   VARCHAR(9)      NOT NULL,
  Site_id       NUMBER          NOT NULL,
PRIMARY KEY(Employee_id, Site_id),
FOREIGN KEY(Employee_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Site_id) REFERENCES SITE(Site_id));

CREATE TABLE PRODUCT
(
  Product_id    NUMBER      NOT NULL,
  Product_type  VARCHAR2(20) NOT NULL,
  List_price    NUMBER,
  Product_size  NUMBER,
  Weight        NUMBER,
  Product_style VARCHAR2(20),
PRIMARY KEY(Product_id),
UNIQUE(Product_type));

CREATE TABLE SALE
(
  Customer_id   VARCHAR2(9)     NOT NULL,
  Employee_id   VARCHAR2(9)     NOT NULL,
  Product_id    NUMBER          NOT NULL,
  Site_id       NUMBER          NOT NULL,
  Sale_time     TIMESTAMP           NOT NULL,
PRIMARY KEY(Customer_id, Employee_id, Product_id, Site_id, Sale_time),
FOREIGN KEY(Customer_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Employee_id) REFERENCES PERSON(Personal_id),
FOREIGN KEY(Product_id) REFERENCES PRODUCT(Product_id),
FOREIGN KEY(Site_id) REFERENCES SITE(Site_id));

CREATE TABLE PART
(
  Part_type     VARCHAR(20)     NOT NULL,
  Product_id    NUMBER,
  Part_amount   NUMBER,
PRIMARY KEY(Part_type),
FOREIGN KEY(Product_id) REFERENCES PRODUCT(Product_id));

CREATE TABLE VENDOR
(
  Vendor_id         NUMBER          NOT NULL,
  Vendor_name       VARCHAR2(20)    NOT NULL,
  Vendor_address    VARCHAR2(50),
  Account_no        NUMBER,
  Credit_rating     NUMBER,
  Vendor_Url        VARCHAR(50),
PRIMARY KEY(Vendor_id));
  
CREATE TABLE SUPPLIED_BY
(
  Vendor_id         NUMBER      NOT NULL,
  Part_type         VARCHAR(20) NOT NULL,
  Price             NUMBER,
  Weight            NUMBER,
PRIMARY KEY(Vendor_id, Part_type),
FOREIGN KEY(Vendor_id) REFERENCES VENDOR(Vendor_id),
FOREIGN KEY(Part_type) REFERENCES PART(Part_type));

CREATE TABLE PART_PRODUCT_VENDOR
(
    Part_type       VARCHAR(20)     NOT NULL,
    Product_id      NUMBER          NOT NULL,
    Vendor_id       NUMBER          NOT NULL, 
PRIMARY KEY(Part_type, product_id, vendor_id),
FOREIGN KEY(Part_type) REFERENCES PART(Part_type),
FOREIGN KEY(Product_id) REFERENCES PRODUCT(Product_id),
FOREIGN KEY(Vendor_id) REFERENCES VENDOR(Vendor_id));

INSERT ALL 
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('123456789','Mustafa','Hamna','F',22, '123 Lane', null, 'Dallas', 'TX', 77043, 1, null, 'Developer', 'Junior',0,0,null,1)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('111222333','Cole','Hellen','F',25, 'Apt 23', '456 Lane', 'Richardson', 'TX', 77043, 0, null, null, null,1,0,null,1)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('444555666','Smith','John','M',30, '789 Lane', null, 'Dallas', 'TX', 77074, 1, 123456789, 'Assistant', 'Junior',0,0,null,0)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('777888999','Granger','Hermione','M',40, 'Chestnut Lane', null, 'Addison', 'TX', 75134, 1, null, 'Saleswoman', 'Senior',0,0,null,0)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('333222111','Potter','Harry','M',42, '4 Privet Drive', null, 'Plano', 'TX', 77123, 0, null, null, null,1,0,null,1)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('999888777','Weasley','Ron','M',43, 'Apt 11', '111 St', 'Dallas', 'TX', 71111, 0, null, null, null,0,1,'Hermione Granger',0)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('101112134','Holmes','Sherlock','M',56, '221B', 'Baker St', 'Richardson', 'TX', 75074,1, '777888999','Salesman', 'Junior',0,0,null,1)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('111111111','Lovegood','Luna','F',20, '111 Walnut Ln', null, 'Richardson', 'TX', 75074,0, null,null, null,0,1,'Hamna Mustafa',0)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('222222222','Weasley','Ginny','F',17, '111 Walnut Ln', null, 'Richardson', 'TX', 75074,0, null,null, null,0,1,'Hamna Mustafa',0)
INTO PERSON (Personal_id, Lname, Fname, Gender, Age, Address_1, Address_2, City, State, Zipcode, Employee_flag, Super_id, Title, Rank, Potential_flag, Customer_flag, Pref_salesmen, Candidate_flag) VALUES ('333333333','Bing','Chandler','M',50, '987 Portside Ln', null, 'Richardson', 'TX', 75074,0, null,null, null,0,1,'Hamna Mustafa',0)
select * from dual;


INSERT ALL
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('111222333','4691234567')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('111222333','2261234567')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('101112134','4691011123')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('123456789','4691112223')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('333222111','7131015433')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('444555666','9876543210')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('777888999','1111234567')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('999888777','7138882225')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('999888777','2263853957')
INTO PHONE_NUMBERS(Personal_id,Phone_no) VALUES ('123456789','4295729572')
select * from dual;

INSERT ALL
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 1, to_date('2011-01-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 2, to_date('2011-02-01','yyyy,mm,dd'),2100)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 3, to_date('2011-03-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 4, to_date('2011-04-01','yyyy,mm,dd'),3200)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 5, to_date('2011-05-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (123456789, 6, to_date('2011-06-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 1, to_date('2011-01-01','yyyy,mm,dd'),4000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 2, to_date('2011-02-01','yyyy,mm,dd'),5000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 3, to_date('2011-03-01','yyyy,mm,dd'),3500)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 4, to_date('2011-04-01','yyyy,mm,dd'),4000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 5, to_date('2011-05-01','yyyy,mm,dd'),5000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (444555666, 6, to_date('2011-06-01','yyyy,mm,dd'),4500)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 1, to_date('2011-01-01','yyyy,mm,dd'),500)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 2, to_date('2011-02-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 3, to_date('2011-03-01','yyyy,mm,dd'),700)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 4, to_date('2011-04-01','yyyy,mm,dd'),1000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 5, to_date('2011-05-01','yyyy,mm,dd'),1500)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (777888999, 6, to_date('2011-06-01','yyyy,mm,dd'),500)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 1, to_date('2011-01-01','yyyy,mm,dd'),2000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 2, to_date('2011-02-01','yyyy,mm,dd'),3000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 3, to_date('2011-03-01','yyyy,mm,dd'),3000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 4, to_date('2011-04-01','yyyy,mm,dd'),3000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 5, to_date('2011-05-01','yyyy,mm,dd'),3000)
INTO SALARY(personal_id,transaction_no,pay_date,amount) VALUES (101112134, 6, to_date('2011-06-01','yyyy,mm,dd'),3000)
select * from dual;

INSERT ALL
INTO DEPARTMENT(Dep_id,D_name) VALUES (1,'Finance')
INTO DEPARTMENT(Dep_id,D_name) VALUES (2,'Marketing')
INTO DEPARTMENT(Dep_id,D_name) VALUES (3,'HR')
INTO DEPARTMENT(Dep_id,D_name) VALUES (4,'Development')
INTO DEPARTMENT(Dep_id,D_name) VALUES (5,'Sales')
select * from dual;

INSERT ALL
INTO WORKS_FOR(Personal_id,Dep_id,Start_time,End_time) VALUES (123456789,4, timestamp '2011-01-01 09:00:00',timestamp '2011-01-01 17:00:00')
INTO WORKS_FOR(Personal_id,Dep_id,Start_time,End_time) VALUES (123456789,4, timestamp'2011-03-01 09:00:00',timestamp '2011-03-01 17:00:00')
INTO WORKS_FOR(Personal_id,Dep_id,Start_time,End_time) VALUES (444555666,1, timestamp '2011-02-01 09:00:00',timestamp '2011-02-01 17:00:00')
INTO WORKS_FOR(Personal_id,Dep_id,Start_time,End_time) VALUES (777888999,5, timestamp '2011-01-15 09:00:00',timestamp '2011-01-15 17:00:00')
INTO WORKS_FOR(Personal_id,Dep_id,Start_time,End_time) VALUES (101112134,5, timestamp '2011-06-01 09:00:00',timestamp '2011-06-01 17:00:00')
INTO  WORKS_FOR(personal_id, dep_id, start_time, end_time) VALUES (444555666, 2, timestamp '2011-02-02 09:00:00',timestamp '2011-02-02 17:00:00')
INTO  WORKS_FOR(personal_id, dep_id, start_time, end_time) VALUES (444555666, 3, timestamp '2011-02-02 09:00:00',timestamp '2011-02-02 17:00:00')
INTO  WORKS_FOR(personal_id, dep_id, start_time, end_time) VALUES (444555666, 4, timestamp '2011-02-03 09:00:00',timestamp '2011-02-02 17:00:00')
INTO  WORKS_FOR(personal_id, dep_id, start_time, end_time) VALUES (444555666, 5, timestamp '2011-02-04 09:00:00',timestamp '2011-02-02 17:00:00')
select * from dual;

INSERT ALL
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (2,11111, to_date('2011-01-01','yyyy,mm,dd'),'Marketing job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (2,22222, to_date('2011-01-23','yyyy,mm,dd'),'Another Marketing job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (1,33333, to_date('2011-03-15','yyyy,mm,dd'),'Finance job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (1,44444, to_date('2011-04-05','yyyy,mm,dd'),'Another finance job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (3,12345, to_date('2011-05-01','yyyy,mm,dd'),'HR job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (3,55555, to_date('2011-02-25','yyyy,mm,dd'),'Another HR job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (4,66666, to_date('2011-01-01','yyyy,mm,dd'),'Development job folks!')
INTO JOB(Dep_id,Job_id,Job_date,Description) VALUES (5,77777, to_date('2011-03-01','yyyy,mm,dd'),'Sales job folks!')
select * from dual;

INSERT ALL
INTO APPLIES_TO(candidate_id,job_id) VALUES (111222333,11111)
INTO APPLIES_TO(candidate_id,job_id) VALUES (111222333,22222)
INTO APPLIES_TO(candidate_id,job_id) VALUES (123456789,12345)
INTO APPLIES_TO(candidate_id,job_id) VALUES (101112134,12345)
INTO APPLIES_TO(candidate_id,job_id) VALUES (333222111,12345)
select * from dual;


INSERT ALL
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (111222333, 444555666, 11111, 1, 80, timestamp '2011-01-15 12:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (111222333, 101112134, 11111, 2, 70, timestamp '2011-01-17 13:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (111222333, 101112134, 11111, 3, 80, timestamp '2011-01-20 12:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (111222333, 777888999, 11111, 4, 80, timestamp '2011-01-25 14:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (111222333, 777888999, 11111, 5, 80, timestamp '2011-01-29 15:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 101112134, 12345, 1, 90, timestamp '2011-06-01 12:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 101112134, 12345, 2, 90, timestamp '2011-06-05 10:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 777888999, 12345, 3, 95, timestamp '2011-06-10 10:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 777888999, 12345, 4, 85, timestamp '2011-06-15 11:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 777888999, 12345, 5, 90, timestamp '2011-06-20 11:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (333222111, 123456789, 12345, 1, 40, timestamp '2011-06-01 15:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (101112134, 777888999, 12345, 1, 70, timestamp '2011-06-01 09:00:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (101112134, 777888999, 12345, 2, 50, timestamp '2011-06-01 09:30:00')
INTO INTERVIEW(candidate_id, employee_id,job_id,round,grade,interview_time) VALUES (123456789, 777888999, 11111, 1, 50, timestamp '2011-06-01 09:30:00')
select * from dual;


INSERT ALL
INTO INTERVIEW_EMAIL(candidate_id, email) VALUES (111222333, 'cole.hellen@gmail.com')
INTO INTERVIEW_EMAIL(candidate_id, email) VALUES (123456789, 'hamna.mustafa@gmail.com')
INTO INTERVIEW_EMAIL(candidate_id, email) VALUES (333222111, 'the_chosen_one@gmail.com')
INTO INTERVIEW_EMAIL(candidate_id, email) VALUES (101112134, 'sherlock.holmes@gmail.com')
select * from dual;

INSERT ALL
INTO SITE(Site_id,Site_name,Site_location) VALUES (1,'Headquarters','111 Special Lane, Dallas TX 77043')
INTO SITE(Site_id,Site_name,Site_location) VALUES (2,'Plano Branch','222 Special Lane, Plano TX 75555')
INTO SITE(Site_id,Site_name,Site_location) VALUES (3,'Richardson Branch','333 Special Lane, Richardson TX 73333')
select * from dual;

INSERT ALL
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(123456789,1)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(444555666,2)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(444555666,3)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(777888999,1)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(777888999,2)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(777888999,3)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(101112134,1)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(101112134,2)
INTO SITE_EMPLOYEE(Employee_id, Site_id) VALUES(101112134,3)
select * from dual;

INSERT ALL
INTO PRODUCT(Product_id,Product_type,list_price,product_size,weight,product_style) VALUES (1, 'Cellphone', 1000, 10,7,'Blue color')
INTO PRODUCT(Product_id,Product_type,list_price,product_size,weight,product_style) VALUES (2, 'Cup set', 100, 10,3,'White and circular')
INTO PRODUCT(Product_id,Product_type,list_price,product_size,weight,product_style) VALUES (3, 'Clips', 20, 10,7,'Multicolor')
INTO PRODUCT(Product_id,Product_type,list_price,product_size,weight,product_style) VALUES (4, 'Chair', 300, 10,50,'Black and sleek')
INTO PRODUCT(Product_id,Product_type,list_price,product_size,weight,product_style) VALUES (5, 'Candle', 25, 10,3,'Vanilla Scented')
select * from dual;

INSERT ALL
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,101112134,1,1, timestamp '2011-06-20 12:15:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,101112134,1,1, timestamp '2011-05-20 14:32:17')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,777888999,1,1,  timestamp '2011-04-20 9:07:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,777888999,1,1,  timestamp '2011-02-20 15:54:21')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,777888999,1,1,  timestamp '2011-01-20 12:20:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (999888777,777888999,1,1,  timestamp '2011-06-25 16:15:35')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (111111111,123456789,3,2,  timestamp '2011-03-25 10:45:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (111111111,777888999,5,2,  timestamp '2011-03-25 10:50:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (222222222,444555666,2,3,  timestamp '2011-04-20 11:23:33')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (333333333,123456789,4,3,  timestamp '2011-01-05 12:45:00')
INTO SALE(Customer_id,Employee_id,Product_id,Site_id,Sale_time) VALUES (333333333,123456789,1,1,  timestamp '2011-01-05 16:58:33')
select * from dual;

INSERT ALL
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Cup', 2, 12)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Exterior', 1, 1)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Interior', 1, 1)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Chip', 1, 2)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Camera', 1, 3)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Clip', 3, 6)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Chair leg', 4, 4)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Chair arm', 4, 2)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Cushion', 4, 2)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Wax', 5, 1)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Wick', 5, 3)
INTO PART(Part_type, Product_id, Part_amount) VALUES ('Jar', 5, 1)
select * from dual;

INSERT ALL
INTO VENDOR(vendor_id,vendor_name,vendor_address,account_no,credit_rating,vendor_url) VALUES (1,'GAGA CO', '321 Gaga Lane, Houston, TX 77043',123456,750,'www.gagaco.com')
INTO VENDOR(vendor_id,vendor_name,vendor_address,account_no,credit_rating,vendor_url) VALUES (2,'LALA CO', '321 Lala Lane, Houston, TX 77043',123789,800,'www.lalaco.com')
INTO VENDOR(vendor_id,vendor_name,vendor_address,account_no,credit_rating,vendor_url) VALUES (3,'DADA CO', '321 Dada Lane, Houston, TX 77043',456789,700,'www.dadaco.com')
select * from dual;

INSERT ALL
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Cup', 10,3)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Cup', 5,2)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Cup', 15,3)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Exterior', 200,10)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Interior', 50,3)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Chip', 100,1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Camera', 100,4)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Clip', 1,1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Clip', 2,1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Clip', 3,1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Chair leg', 10,10)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Chair arm', 10,10)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Cushion', 30,5)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Cushion', 25,6)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Wax', 3,0.5)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Wick', 1,0.1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (2, 'Jar', 2,1)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (3, 'Jar', 3,2)
INTO SUPPLIED_BY(vendor_id,part_type,price,weight) VALUES (1, 'Jar', 1,1)
select * from dual;

INSERT ALL
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Cup',2,2)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Exterior',1,3)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Interior',1,3)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Chip',1,3)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Camera',1,3)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Clip',3,2)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Chair leg',4,1)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Chair arm',4,1)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Cushion',4,1)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Wax',5,2)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Wick',5,2)
INTO PART_PRODUCT_VENDOR(Part_type, product_id, vendor_id) VALUES ('Jar',5,1)
select * from dual;



CREATE VIEW AVG_SALARIES(Lastname, Employee_id, avgsalary)
AS SELECT 		lname, SALARY.personal_id, AVG(amount)
      FROM 		SALARY, PERSON
      WHERE 		SALARY.personal_id = PERSON.personal_id
      GROUP BY 		SALARY.personal_id, lname;

SELECT *
FROM   	AVG_SALARIES;

CREATE VIEW NO_ROUNDS_PASSED(candidate_id,Lastname,No_of_rounds_passed)
AS SELECT 		personal_id, lname, COUNT(*)
      FROM 		PERSON, INTERVIEW
      WHERE 		candidate_flag=1 AND personal_id = candidate_id AND grade >= 60
      GROUP BY 		personal_id, lname;

SELECT *
FROM NO_ROUNDS_PASSED;

CREATE VIEW 		NO_OF_ITEMS_SOLD(Product_id, product_type, items_sold)
AS SELECT 		PRODUCT.product_id, product_type, COUNT(*)
      FROM     		PRODUCT, SALE
      WHERE    		PRODUCT.product_id = SALE.product_id
      GROUP BY 		PRODUCT.product_id, product_type;

SELECT *
FROM 		NO_OF_ITEMS_SOLD;

CREATE VIEW 		COST_OF_PRODUCT(Product_id, Purchase_cost)
AS SELECT 		PART_PRODUCT_VENDOR.product_id, SUM(price*part_amount)
FROM 			PART_PRODUCT_VENDOR, SUPPLIED_BY, PART
WHERE	PART_PRODUCT_VENDOR.Vendor_id = SUPPLIED_BY.vendor_id AND PART_PRODUCT_VENDOR.part_type = SUPPLIED_BY.part_type AND PART_PRODUCT_VENDOR.part_type = PART.part_type
GROUP BY 		PART_PRODUCT_VENDOR.product_id;


SELECT *
FROM COST_OF_PRODUCT;


SELECT DISTINCT personal_id, Fname, Lname
FROM 		PERSON, INTERVIEW
WHERE 	candidate_id = (SELECT  personal_id
                      		   	  FROM    PERSON
                      	  WHERE   Lname = 'Cole' AND Fname = 'Hellen') AND employee_id = personal_id AND job_id = 11111;


SELECT  	job_id, job_date
FROM    	JOB, DEPARTMENT
WHERE   	JOB.dep_id = DEPARTMENT.dep_id AND d_name = 'Marketing' AND to_char(job_date,'YYYY') = 2011 AND to_char(job_date,'MM') = 01;

SELECT  fname, lname, personal_id
FROM    PERSON
WHERE   personal_id NOT IN (SELECT  super_id
                            FROM    PERSON
                            WHERE  employee_flag = 1 AND super_id IS NOT NULL) AND employee_flag =1;


SELECT 	site_id, site_location
FROM		SITE
WHERE 	NOT EXISTS ( SELECT site_id
FROM SALE
WHERE to_char(sale_time, 'MM') = 03 AND to_char(sale_time, 'YYYY') = 2011 AND SALE.site_id = SITE.site_id);

SELECT job_id, description
FROM JOB
WHERE job_id NOT IN (SELECT INTERVIEW.job_id
                  FROM INTERVIEW, JOB
                  WHERE candidate_id IN (SELECT candidate_id
                                         FROM INTERVIEW
                                         GROUP BY candidate_id
                                         HAVING count(*) >= 5 AND AVG(grade) >= 70) AND round = 5 AND JOB.job_id = INTERVIEW.job_id AND interview_time <= ADD_MONTHS(job_date,1)) ;


SELECT DISTINCT Fname, lname, personal_id
FROM PERSON, SALE, PRODUCT
WHERE Employee_id = personal_id AND SALE.product_id = PRODUCT.product_id AND list_price >= 200;

SELECT 	dep_id, d_name
FROM 		DEPARTMENT
WHERE 	NOT EXISTS (SELECT dep_id
                 	 	          FROM JOB
WHERE JOB.dep_id = DEPARTMENT.dep_id AND (to_char(job_date, 'YYYY-MM-DD') = '2011-01-01' OR to_char(job_date, 'YYYY-MM-DD') = '2011-02-01'));


SELECT 	DISTINCT PERSON.personal_id, Fname, lname, WORKS_FOR.dep_id
FROM		PERSON, WORKS_FOR, APPLIES_TO
WHERE 	PERSON.personal_id = candidate_id AND job_id = 12345 AND PERSON.personal_id = WORKS_FOR.personal_id;

SELECT product_Type, COUNT(Product_type)
FROM   PRODUCT, SALE
WHERE  PRODUCT.product_id = SALE.product_id
GROUP  BY Product_Type
HAVING COUNT(Product_Type)=(SELECT      MAX(mycount)
                            FROM        (SELECT product_type, COUNT(*) mycount
                                         FROM PRODUCT, SALE
                                         WHERE PRODUCT.product_id = SALE.product_id
                                         GROUP BY    product_type));
                                         
SELECT PRODUCT.Product_id, product_type, (PRODUCT.list_price - SUM(price*part_amount)) as net_profit
FROM PART_PRODUCT_VENDOR, SUPPLIED_BY, PART, PRODUCT
WHERE PART_PRODUCT_VENDOR.Vendor_id = SUPPLIED_BY.vendor_id AND PART_PRODUCT_VENDOR.part_type = SUPPLIED_BY.part_type AND PART_PRODUCT_VENDOR.part_type = PART.part_type AND PART_PRODUCT_VENDOR.product_id = PRODUCT.product_id
GROUP BY PRODUCT.Product_id, Product_type, list_price
HAVING PRODUCT.list_price - SUM(price*part_amount) = (SELECT MAX(profit)
FROM (SELECT PART_PRODUCT_VENDOR.product_id, (PRODUCT.list_price - SUM(price*part_amount)) profit
     FROM PART_PRODUCT_VENDOR, SUPPLIED_BY, PART, PRODUCT
     WHERE PART_PRODUCT_VENDOR.Vendor_id = SUPPLIED_BY.vendor_id AND PART_PRODUCT_VENDOR.part_type = SUPPLIED_BY.part_type AND PART_PRODUCT_VENDOR.part_type = PART.part_type AND PART_PRODUCT_VENDOR.product_id = PRODUCT.product_id
     GROUP BY PART_PRODUCT_VENDOR.product_id, list_price));
                     
SELECT PERSON.personal_id, Fname, lname
FROM PERSON, WORKS_FOR
WHERE PERSON.personal_id = WORKS_FOR.personal_id 
GROUP BY PERSON.personal_id, fname, lname
HAVING COUNT(*) = (SELECT count(*)
                   FROM DEPARTMENT);
                    
SELECT  INTERVIEW.candidate_id, Fname, Lname, email
FROM INTERVIEW , JOB, INTERVIEW_EMAIL, PERSON
WHERE INTERVIEW.candidate_id IN (SELECT candidate_id
                     FROM INTERVIEW
                     WHERE round = 5 AND Grade >= 60) AND JOB.job_id = INTERVIEW.job_id AND INTERVIEW.candidate_id = INTERVIEW_EMAIL.candidate_id AND INTERVIEW.candidate_id = personal_id
GROUP BY INTERVIEW.candidate_id, Fname, Lname, email
HAVING AVG(GRADE) >= 70;
                                        
SELECT DISTINCT Fname,Lname, phone_no, email
FROM INTERVIEW, PERSON, PHONE_NUMBERS, INTERVIEW_EMAIL
WHERE INTERVIEW.candidate_id NOT IN (SELECT candidate_id
                           FROM INTERVIEW
                           GROUP BY candidate_id, job_id
                           HAVING count(*) < 5 AND AVG(grade) < 70) 
      AND INTERVIEW.candidate_id IN (SELECT candidate_id
                           FROM INTERVIEW
                           GROUP BY candidate_id, job_id
                           HAVING count(*) >= 5 AND AVG(grade) >= 70)
      AND INTERVIEW.candidate_id = PERSON.personal_id AND INTERVIEW.candidate_id = PHONE_NUMBERS.personal_id AND INTERVIEW.candidate_id = INTERVIEW_EMAIL.candidate_id;


SELECT Fname, Lname, PERSON.Personal_id, AVG(amount)
FROM PERSON, SALARY
WHERE PERSON.Personal_id = SALARY.Personal_id
GROUP BY Fname, Lname, PERSON.Personal_id
HAVING AVG(amount) = (SELECT MAX(avgsalary)
                     FROM (SELECT Personal_id, AVG(amount) avgsalary
                     FROM SALARY
                     GROUP BY Personal_id));


SELECT VENDOR.Vendor_id, vendor_name, price
FROM SUPPLIED_BY, VENDOR
WHERE price = (SELECT MIN(price)
               FROM SUPPLIED_BY
               WHERE Part_type = 'Cup' AND Weight < 4) AND VENDOR.vendor_id = SUPPLIED_BY.vendor_id;

