
CREATE DATABASE  employees;

USE employees;

DROP TABLE IF EXISTS dept_emp,
                     dept_manager,
                     titles,
                     salaries, 
                     employees, 
                     departments,
					 time_clock,
					 employees_schedule;



CREATE TABLE employees (
    emp_no      INT  IDENTITY(1,1)            NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      CHAR(2) CHECK (gender IN ('M','F'))  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE(dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) 
; 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) 
; 

CREATE TABLE time_clock(
    time_clock_no       INT             NOT NULL,
	emp_no              INT             NOT NULL,
    time_clock_date     DATE            NOT NULL,
    clock_in            Time            NOT NULL,
    in_break            Time            NOT NULL, 
    out_break           Time            NOT NULL,   
    clock_out           Time            NOT NULL,
    PRIMARY KEY (time_clock_no ),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
);

CREATE TABLE employees_schedule(
    emp_sched_no        INT             NOT NULL,
	emp_no              INT             NOT NULL,
    work_date           DATE            NOT NULL,
    work_start_hour     Time            NOT NULL,
    work_end_hour		Time            NOT NULL, 
    PRIMARY KEY (emp_sched_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
);
