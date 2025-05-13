const express = require('express');
const router = express.Router();
const cinemaController = require('../controllers/cinemaController');
const scheduleController = require('../controllers/scheduleController');

router.get('/all', cinemaController.getAllCinema);

router.get('/:cinemaId/schedules', scheduleController.getScheduleByCinema);

router.get('/movie/:movieId/:city', cinemaController.getCinemasByMovieAndCity);

router.get('/theater/:theaterId/seat', cinemaController.getTheaterSeat);

module.exports = router;