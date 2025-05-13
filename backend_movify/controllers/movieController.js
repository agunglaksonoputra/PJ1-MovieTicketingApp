const movieService = require("../services/MovieService");

const getPopular = async (req, res) => {
    try {
        console.log("Entering getPopular");
        const movie = await movieService.getPopular();
        res.json(movie);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};

module.exports = {
    getPopular,
};