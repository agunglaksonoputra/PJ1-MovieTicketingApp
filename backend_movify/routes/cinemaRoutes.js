const express = require('express');
const router = express.Router();
const cinemaController = require('../controllers/cinemaController');
const scheduleController = require('../controllers/scheduleController');

router.get('/all', cinemaController.getAllCinema);

router.get('/city/:city', cinemaController.getCinemaByCity);

router.get('/:cinemaId/theater', cinemaController.getTheaterByCinema);

router.get('/:cinemaId/theater/:theaterId/schedule/movie/:filmId', scheduleController.getScheduleByTheater);

router.get('/get-cinema-by-showing-movie/city/:city/movie/:movieId', cinemaController.getCinemaShowingMovies);

router.get('/schedule/:scheduleId/seat-booked', cinemaController.getSeatBookedBySchedule);

router.get('/:cinemaId/schedules', scheduleController.getScheduleByCinema);

router.get('/movie/:movieId/:city', cinemaController.getCinemasByMovieAndCity);

router.get('/theater/:theaterId/seat', cinemaController.getTheaterSeat);



module.exports = router;