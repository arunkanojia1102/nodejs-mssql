function getStandardResponse(statusCode, success, message, data = null){
    return{
        statusCode: statusCode,
        success: success,
        message: message,
        data: data
    }
}

module.exports = {
    getStandardResponse
}