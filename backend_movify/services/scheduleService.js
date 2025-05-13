const { Schedule, Cinema, Theater, Movie } = require("../models");

const getScheduleByCinema = async (cinemaId) => {
     return await Cinema.findByPk(cinemaId, {
        include: [
            {
                model: Theater,
                include: [
                    {
                        model: Schedule,
                        attributes: ['id', 'title', 'date', 'start_time', 'price']
                    }
                ]
            }
        ]
    });
};

module.exports = {
  getScheduleByCinema  
};