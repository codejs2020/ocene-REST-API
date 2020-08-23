const mysql = require('mysql')
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'lubenica901',
    database: 'ocene'
});

exports.getAllStudentsQuery = result => {
    pool.query("select * from students", (err, res) => {
        if (err) throw err
        console.log(res)

    })
    result(null, res)
}

exports.getOneStudentQuery = (studentId, result) => {
    pool.query("select * from students where id = ?", [studentId], function (err, res) {
        if (err) throw err
        console.log(res)

    }
    )
    result(null, res[0])
}