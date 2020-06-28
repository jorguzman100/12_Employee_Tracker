// Requiere dependencies
const inquirer = require("inquirer");
const mysql = require("mysql");


// Create the connection to MySQL
const connection = mysql.createConnection({
    port: 3306,
    user: 'root',
    password: 'holahola0101',
    database: 'employeesDB'
});

// Activate the connection
connection.connect((err) => {
    if (err) throw err;
    startCMS();
});

// CLI
const startCMS = () => {
    console.log('startCMS()');
}

// Interact with the database

