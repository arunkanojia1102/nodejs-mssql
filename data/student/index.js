'use strict';
const config = require('../../config');
const sql = require('mssql');

const getStudents = async() => {
    try{
        let pool = await sql.connect(config.sql);
        const students = await pool.request()
            .query('SELECT * FROM vwStudent');

        return students.recordset;
    }
    catch(err){
        console.log(err);
        return err.message;
    }
}

const insertStudent = async(studentData) => {
    try{
        let pool = await sql.connect(config.sql);
        const student = await pool.request()
            .input('firstName', sql.NVarChar(200), studentData.firstName)
            .input('lastName', sql.NVarChar(200), studentData.lastName)
            .input('fathersName', sql.NVarChar(200), studentData.fathersName)
            .input('motherName', sql.NVarChar(200), studentData.motherName)
            .input('dateOfBirth', sql.Date, studentData.dateOfBirth)
            .input('courseId', sql.Int, studentData.courseId)
            .input('disciplineId', sql.Int, studentData.disciplineId)
            .input('enrollmentNo', sql.NVarChar(100), studentData.enrollmentNo)
            .input('admissionDate', sql.Date, studentData.admissionDate)
            .input('isActive', sql.Bit, studentData.isActive)
            .output('StudentId', sql.Int)
            .query('INSERT INTO Student(firstName, lastName, fathersName, motherName, dateOfBirth, courseId, disciplineId, enrollmentNo, admissionDate, isActive)'
            + ' VALUES(@firstName, @lastName, @fathersName, @motherName, @dateOfBirth, @courseId, @disciplineId, @enrollmentNo, @admissionDate, @isActive);'
            + ' SELECT StudentId = SCOPE_IDENTITY();');

        return student.output.StudentId;
    }
    catch(err){
        console.log(err);
        return err.message;
    }   
}

const updateStudent = async(studentId, studentData) => {
    try{
        let pool = await sql.connect(config.sql);
        const student = await pool.request()
            .input('firstName', sql.NVarChar(200), studentData.firstName)
            .input('lastName', sql.NVarChar(200), studentData.lastName)
            .input('fathersName', sql.NVarChar(200), studentData.fathersName)
            .input('motherName', sql.NVarChar(200), studentData.motherName)
            .input('dateOfBirth', sql.Date, studentData.dateOfBirth)
            .input('courseId', sql.Int, studentData.courseId)
            .input('disciplineId', sql.Int, studentData.disciplineId)
            .input('enrollmentNo', sql.NVarChar(100), studentData.enrollmentNo)
            .input('admissionDate', sql.Date, studentData.admissionDate)
            .input('isActive', sql.Bit, studentData.isActive)
            .input('StudentId', sql.Int, studentId)
            .query('UPDATE Student SET firstName = @firstName, lastName = @lastName, fathersName = @fathersName, motherName = @motherName,'
                    + ' dateOfBirth = @dateOfBirth, courseId = @courseId, disciplineId = @disciplineId, enrollmentNo = @enrollmentNo,'
                    + ' admissionDate = @admissionDate, isActive = @isActive'
                    + ' WHERE StudentId = @StudentId');

        return student.rowsAffected[0];
    }
    catch(err){
        console.log(err);
        return err.message;
    }   
}

const deleteStudent = async(studentId) => {
    try{
        let pool = await sql.connect(config.sql);
        const student = await pool.request()
            .input('StudentId', sql.Int, studentId)
            .query('UPDATE Student SET isActive = 0 WHERE StudentId = @StudentId');

        return student.rowsAffected[0];
    }
    catch(err){
        console.log(err);
        return err.message;
    }   
}

module.exports = {
    getStudents,
    insertStudent,
    updateStudent,
    deleteStudent
}