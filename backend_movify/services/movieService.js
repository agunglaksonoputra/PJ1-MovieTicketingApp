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
            original_language: {
                [Op.in]: ['id', 'en', 'th']
            }
        },
        order: [['release_date', 'DESC']]
    });
}

module.exports = {
    getAllMovies,
    getPopular
};