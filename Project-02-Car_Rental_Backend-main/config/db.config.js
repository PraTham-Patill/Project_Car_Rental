const mysql = require('mysql2');

const connection = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: 'root@123',
  database: 'car_rental_project'
});

connection.query("show tables", (err, result, fields) => {
  if (err) {
    console.log(err);
  }
  return console.log(result);
})

module.exports = connection;