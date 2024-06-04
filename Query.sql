CREATE DATABASE company_db;
USE company_db;

CREATE TABLE departments(
	department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

CREATE TABLE projects(
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

INSERT INTO employees(first_name, last_name, email, hire_date, job_title, department_id)
VALUES
	('John', 'Doe', 'john.doe@company.com', '2023-01-01', 'Software Engineer', 1), 
	('Jane', 'Smith', 'jane.smith@company.com', '2024-02-15', 'Marketing Manager', 2), 
	('Olivia', 'Garcia', 'olivia.garcia@company.com', '2022-06-12', 'Sales Representative', 3), 
	('Michael', 'Young', 'michael.young@company.com', '2023-09-20', 'Graphic Designer', 4), 
	('Amanda', 'Johnson', 'amanda.johnson@company.com', '2024-04-05', 'Human Resources Specialist', 5), 
	('David', 'Lee', 'david.lee@company.com', '2022-12-08', 'Accountant', 6), 
	('Sophia', 'Hernandex', 'sophia.hernandez@company.com', '2024-05-23', 'Customer Support Specialist', 7), 
	('William', 'Chen', 'william.chen@company.com', '2023-03-14', 'Web Developer', 1), 
	('Isabella', 'Rodriguez', 'isabella.rodriguez@company.com', '2021-10-26', 'Business Analyst', 5), 
	('Benjamin', 'Miller', 'benjamin.miller@company.com', '2024-01-29', 'Data Analyst', 8);

INSERT INTO departments(department_name)
VALUES
	('Engineering'),
    ('Marketing'),
    ('Sales'),
    ('Finance'),
    ('Customer Support'),
    ('Human Resources'),
    ('Legal'),
    ('Operations'),
    ('Research and Development'),
    ('Product Managment');
    
INSERT INTO projects(project_name, start_date, end_date, budget, department_id)
VALUES
	('Website Development', '2023-01-15', '2023-12-15', 50000, 1),
	('Marketing Campaign', '2023-03-01', '2023-08-01', 75000, 2),
	('Sales Automation Software Implementation', '2023-02-10', '2023-11-10', 60000, 3),
	('Mobile App Development', '2023-04-20', '2024-04-20', 90000, 4),
	('Customer Support Portal Upgrade', '2023-05-15', '2023-12-15', 45000, 1),
	('Financial Reporting System Optimization', '2023-06-01', '2024-06-01', 100000, 2),
	('Product Research and Development', '2023-07-10', '2024-07-10', 120000, 3),
	('Employee Training Program Development', '2023-08-15', '2024-08-15', 55000, 4),
	('Legal Compliance Audit', '2023-09-01', '2024-09-01', 80000, 1),
	('Supply Chain Optimization Project', '2023-10-20', '2024-10-20', 70000, 2);

SELECT * from employees;
SELECT * from departments;
SELECT * from projects;

-- 1. List all employees in the Engineering department:
SELECT *
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name='Engineering';

-- 2. Count the number of projects in each department: 
SELECT department_name, COUNT(*) AS number_of_projects
FROM departments d
JOIN projects p ON d.department_id = p.department_id
GROUP BY department_name;

-- 3. Find the total budget for all projects in the Marketing department:
SELECT department_name, SUM(budget) AS budget_all_projects
FROM projects p
JOIN departments d ON d.department_id = p.department_id
WHERE department_name = 'Marketing';

-- 4. List all employees hired in the last 12 months:
SELECT employee_id, first_name, last_name
FROM employees
WHERE hire_date >= curdate()-interval 12 month;

-- 5. Find the totla number of employees in each department:
SELECT department_name, COUNT(*) AS total_employees
FROM employees e
JOIN departments d ON d.department_id = e.department_id
GROUP BY department_name;

-- 6. Calculate the average project duration:
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_project_duration
FROM projects;












