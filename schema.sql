DROP DATABASE IF EXISTS employeesDB;
CREATE database employeesDB;

USE employeesDB;

CREATE TABLE Departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(30) NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE Roles (
  role_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NULL,
  salary DECIMAL(9, 2) NULL,
  department_id INT NULL,
  PRIMARY KEY (role_id),
  FOREIGN KEY (department_id) REFERENCES Departments (department_id)
);

CREATE TABLE Employees (
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NULL,
  last_name VARCHAR(30) NULL,
  role_id INT NULL,
  manager_id INT NULL,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (role_id) REFERENCES Roles (role_id)
  -- FOREIGN KEY (manager_id) REFERENCES Employees (manager_id)
);
