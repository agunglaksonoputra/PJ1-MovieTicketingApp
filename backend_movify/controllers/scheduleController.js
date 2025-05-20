const scheduleService = require('../services/scheduleService');

const getScheduleByCinema = async (req, res) => {
    const { cinemaId } = req.params;
    try {
        console.log("Entering getScheduleByCinema");
        const cinema = await scheduleService.getScheduleByCinema(cinemaId);
        if (!cinema) {
            return res.status(404).json({ message: "Cinema not found" });
        }

        res.json(cinema);
    } catch(error) {
        res.status(500).json({ message: error.message});
    }
};

const getScheduleByTheater = async (req, res) => {
    const { theaterId, filmId } = req.params;
    try {
        console.log("Entering getScheduleByTheater");
        const result = await scheduleService.getScheduleByTheater(theaterId, filmId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};

module.exports = {
    getScheduleByCinema,
    getScheduleByTheater
};