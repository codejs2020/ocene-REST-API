const studentQueries = require('./studentQueries')

exports.getAllStudents = (req, res) => {
    res.status(200).json(studentQueries.getAllStudentsQuery)
}

exports.getStudent = (req, res) => {
    const studentId = Number(req.params.id)
    res.status(200).json(studentQueries.getOneStudentQuery(studentId))
}
exports.addNewStudent = (req, res) => {

}

exports.deleteStudent = (req, res) => {

}

exports.updateStudent = (req, res) => {

}