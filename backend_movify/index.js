const express = require('express');
const { connectionDatabase } = require('./config/db');

const app = express();
const PORT = process.env.PORT;

const movieRoutes = require('./routes/movieRoutes');
const cinemaRoutes = require('./routes/cinemaRoutes');

// Middleware untuk parsing JSON
app.use(express.json());


app.use('/api/movie', movieRoutes);
app.use('/api/cinema', cinemaRoutes);


// Menjalankan server
app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});

connectionDatabase();
