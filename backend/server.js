const express = require('express');
const meditationRoutes = require('./adapters/routes/meditationRoutes');
const songRoutes = require('./adapters/routes/songRoutes');

const app = express();
const port  = process.env || 3000;


app.use('/meditation', meditationRoutes);
app.use('/song', songRoutes);

app.listen(port, () => {
    console.log('Listening on port ' + port);
});
