USE employeesDB;

INSERT INTO department (department_name) 
VALUES ('HR'), ('IT'), ('R&D'), ('Purchasing'), ('Sales'), ('Admin');

INSERT INTO role (title, salary, department_id) 
VALUES ('Recruiter', 15000, 1), ('Trainer', 15000, 1), ('Payroll', 12000, 1), ('HR Manager', 35000, 1),
('Web Developer', 25000, 2), ('UI Engineer', 20000, 2), ('Database Engineer', 12000, 2), ('IT Manager', 40000, 2),
('Engine Engineer', 20000, 3), ('Power Train Engineer', 20000, 3), ('Chasis Engineer', 20000, 3), ('R&D Manager', 37000, 3),
('Accessories Purchaser', 22000, 4), ('Main Parts Purchaser', 22000, 4), ('Interior Parts Purchaser', 22000, 4), ('Purchasing Manager', 37000, 4),
('North Sales', 30000, 5), ('South Sales', 30000, 5), ('East Sales', 30000, 5), ('Sales Manager', 50000, 5),
('Control', 18000, 6), ('Accountant', 20000, 6), ('Finance', 22000, 6), ('Admin Manager', 35000, 6);

INSERT INTO employee (first_name, last_name, role_id, manager_id) 
VALUES ('Juan', 'García', 1, 4), ('Karla', 'Anda', 2, 4), ('Alma', 'Rivera', 3, 4), ('Pamela', 'Santos', 4, NULL),
('Susana', 'Morales', 5, 8), ('Andrea', 'Carrasco', 6, 8), ('Laura', 'Cabrera', 7, 8), ('Humberto', 'Rodríguez', 8, NULL),
('Peter', 'Arroyo', 9, 12), ('Arturo', 'Cortes', 10, 12), ('Viridiana', 'Gutiérrez', 11, 12), ('Miriam', 'González', 12, NULL),
('Edith', 'Marquez', 13, 16), ('Paulina', 'Rubio', 14, 16), ('Eduardo', 'Capetillo', 15, 16), ('Horacio', 'Obregón', 16, NULL),
('Thalía', 'Mendez', 17, 20), ('Emmanueal', 'Carbajal', 18, 20), ('Francisco', 'Mijares', 19, 20), ('Luis', 'Miguel', 20, NULL),
('Super', 'Man', 21, 24), ('Bat', 'Man', 22, 24), ('Iron', 'Man', 23, 24), ('Super', 'Woman', 24, NULL);

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employee;

SELECT *
FROM employee
LEFT JOIN role ON employee.role_id = role.role_id;

SELECT *
FROM role
LEFT JOIN department ON role.department_id = department.department_id;

SELECT *
FROM employee, role, department
WHERE employee.role_id = role.role_id AND role.department_id = department.department_id;