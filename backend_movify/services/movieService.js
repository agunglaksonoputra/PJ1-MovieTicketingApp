const { Op } = require("sequelize");
const { Movie } = require("../models");

const getAllMovies = async () => {
    return await Movie.findAll();
};

const getPopular = async () => {
    return await Movie.findAll({
        where: {
            vote_count: {
                [Op.ne]: 0
            },
        },
        order: [['tmdb_popularity', 'DESC']]
    });
}

const getNowPlaying = async () => {
    return await Movie.findAll({
        where: {
            vote_count: {
                [Op.ne]: 0
            },
        },
        order: [['vote_average', 'DESC']]
    });
}

module.exports = {
    getAllMovies,
    getPopular,
    getNowPlaying
};