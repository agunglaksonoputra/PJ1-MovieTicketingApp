const express = require('express');
const router = express.Router();
const bookingController = require('../controllers/bookingController');

router.get('/:scheduleId', bookingController.getBookingByScheduleId);


module.exports = router;