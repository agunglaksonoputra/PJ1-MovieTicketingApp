const express = require('express');
const router = express.Router();
const movieController = require('../controllers/movieController');

router.get('/popular', movieController.getPopular);
router.get('/now_playing', movieController.getNowPlaying);

module.exports = router;