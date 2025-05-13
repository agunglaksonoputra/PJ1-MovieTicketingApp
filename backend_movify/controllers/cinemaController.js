const cinemaService = require('../services/cinemaService');

const getAllCinema = async (req, res) => {
    try {
        console.log("Entering getAllCinema");
        const cinema = await cinemaService.getAllCinema();
        res.json(cinema);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};

const getCinemasByMovieAndCity = async (req, res) => {
    const { movieId, city } = req.params;
    try {
        console.log("Entering getCinemasByMovieAndCity");
        const result = await cinemaService.getCinemasByMovieAndCity(movieId, city);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

const getTheaterSeat = async (req, res) => {
    const { theaterId } = req.params;
    try {
        const result = await cinemaService.getTheaterSeat(theaterId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

module.exports = {
    getAllCinema,
    getCinemasByMovieAndCity,
    getTheaterSeat
};