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

const getCinemaByCity = async (req, res) => {
    const { city } = req.params;
    try {
        console.log("Entering getCinemaByCity");
        const result = await cinemaService.getCinemaByCity(city);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};

const getTheaterByCinema = async (req, res) => {
    const { cinemaId } = req.params
    try {
        console.log("Entering getTheaterByCinema");
        const result = await cinemaService.getTheaterByCinema(cinemaId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};

const getCinemaShowingMovies = async (req, res) => {
    const { city, movieId } = req.params;
    try {
        console.log("Entering getCinemaShowingMovies");
        const result = await cinemaService.getCinemaShowingMovies(city, movieId);
        res.json(result);
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
        console.log("Entering getTheaterSeat");
        const result = await cinemaService.getTheaterSeat(theaterId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

const getSeatBookedBySchedule = async (req, res) => {
    const { scheduleId } = req.params;
    try {
        console.log("Entering getSeatBookedBySchedule");
        const result = await cinemaService.getSeatBookedBySchedule(scheduleId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

module.exports = {
    getAllCinema,
    getCinemaByCity,
    getTheaterByCinema,
    getCinemaShowingMovies,
    getCinemasByMovieAndCity,
    getTheaterSeat,
    getSeatBookedBySchedule
};