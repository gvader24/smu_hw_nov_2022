-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZljqDW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Departments" (
    "dept_no" varchar(100)   NOT NULL,
    "dept_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(100)   NOT NULL,
    "title" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(100)   NOT NULL,
    "birth_date" timestamp default localtimestamp  NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "sex" varchar(100)   NOT NULL,
    "hire_date" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Department_Employees" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(100)   NOT NULL
);

CREATE TABLE "Department_Managers" (
    "dept_no" varchar(100)   NOT NULL,
    "emp_no" int   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

