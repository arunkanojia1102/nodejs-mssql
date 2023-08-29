'use strict';
const helperMethods = require('../helpers/helperMethods')
const studentData = require('../data/student');

const getStudents = async(req, res, next) => {
    try{
        const students = await studentData.getStudents();
        res.json(helperMethods.getStandardResponse(200, true, "", students));
    }
    catch(err){
        res.status(400).json(helperMethods.getStandardResponse(400, false, 'Bad Request. Server cannot process the request. ' + err.message));
    }
}

const insertStudent = async(req, res, next) => {
    try{
        const studentInfo = req.body;
        const studentId = await studentData.insertStudent(studentInfo);
        res.json(helperMethods.getStandardResponse(200, true, "", { "value": studentId }));
    }
    catch(err){
        res.status(400).json(helperMethods.getStandardResponse(400, false, 'Bad Request. Server cannot process the request. ' + err.message));
    }
}

const updateStudent = async(req, res, next) => {
    try{
        const studentId = req.params.id;
        const studentInfo = req.body;
        const rowsAffected = await studentData.updateStudent(studentId, studentInfo);
        res.json(helperMethods.getStandardResponse(200, true, "", { "value": rowsAffected }));
    }
    catch(err){
        res.status(400).json(helperMethods.getStandardResponse(400, false, 'Bad Request. Server cannot process the request. ' + err.message));
    }
}

const deleteStudent = async(req, res, next) => {
    try{
        const studentId = req.params.id;
        const rowsAffected = await studentData.deleteStudent(studentId);
        res.json(helperMethods.getStandardResponse(200, true, "", { "value": rowsAffected }));
    }
    catch(err){
        res.status(400).json(helperMethods.getStandardResponse(400, false, 'Bad Request. Server cannot process the request. ' + err.message));
    }
}

module.exports = {
    getStudents,
    insertStudent,
    updateStudent,
    deleteStudent
}