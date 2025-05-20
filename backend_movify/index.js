const express = require('express');
const cors = require('cors');
const { connectionDatabase } = require('./config/db');



const app = express();
const PORT = process.env.PORT;

const movieRoutes = require('./routes/movieRoutes');
const cinemaRoutes = require('./routes/cinemaRoutes');
const bookingRoutes = require('./routes/bookingRoutes');

// Middleware untuk parsing JSON
app.use(cors());
app.use(express.json());


app.use('/api/movie', movieRoutes);
app.use('/api/cinema', cinemaRoutes);
app.use('/api/booking', bookingRoutes);


// Menjalankan server
app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});

connectionDatabase();
