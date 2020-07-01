// Requiere dependencies
const mysql = require("mysql2/promise");
// const mysql = require("mysql");


class Query {
    constructor(crud, table, options, where, ...columns) {
        this.crud = crud;
        this.table = table;
        this.options = options;
        this.where = where;
        this.columns = columns;
        this.query = '';
        this.data;
        this.message;
    }

    async buildQuery() {
        /* console.log('this.crud: ', this.crud);
        console.log('this.table: ', this.table);
        console.log('this.options: ', this.options);
        console.log('this.where: ', this.where);
        console.log('this.columns: ', this.columns); */

        // Select the CRUD query
        switch (this.crud) {
            case 'Create':
                this.query = `INSERT INTO ${this.table} SET ?`;
                this.data = await this.runQuery();
                this.message = `Record created`
                break;
            case 'Read':
                this.query = `SELECT ${this.columns} FROM ${this.table}`;
                this.data = await this.runQuery();
                this.message = `Table: ${this.table}`
                break;
            case 'Update':
                this.query = `UPDATE ${this.table} SET ? WHERE ${this.where}`;
                this.data = await this.runQuery();
                this.message = `Record updated`;
                break;
            case 'Delete':
                this.query = `DELETE FROM ${this.table} WHERE ${this.where}`
                this.data = await this.runQuery();
                this.message = `Record deleted`
                break;
            case 'Read Where':
                this.query = `SELECT ${this.columns} FROM ${this.table} WHERE ${this.where}`;
                this.data = await this.runQuery();
                this.message = `Main View`
                // return this.data;
                break;
        }
        return { data: this.data, message: this.message };
    }

    async runQuery() {
        try {
            // Create the connection to MySQL
            const connection = await mysql.createConnection({
                port: 3306,
                user: 'root',
                password: 'holahola0101',
                database: 'employeesDB'
            });

            // Run the query
            const [data] = await connection.query(this.query, this.options);
            await connection.end();
            return data;
        } catch (err) {
            console.log(err);
        }
    }
}

module.exports = Query;