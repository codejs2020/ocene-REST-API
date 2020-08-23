const express = require('express')
const app = express()
const morgan = require('morgan')
const port = 3333
const studentController = require('./studentController')

app.use(express.json())
app.use(morgan('common'))
app.route('/students').get(studentController.getAllStudents)
app.route('/students/:id').get(studentController.getStudent).post(studentController.addNewStudent).patch(studentController.updateStudent).delete(studentController.deleteStudent)


app.listen(port, () => {
    console.log(`server running on port ${port}`)
})