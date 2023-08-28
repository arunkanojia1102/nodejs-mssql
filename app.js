const express = require('express');
const config = require('./config');

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
    res.status(200).json('API is running');
});

app.listen(config.port, () => {
    console.log(`Server is listening at http://${config.host}:${config.port}`);
})