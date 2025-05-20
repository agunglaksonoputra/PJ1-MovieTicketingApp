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

const getScheduleByTheater = async (theaterId, filmId) => {
  return await Schedule.findAll({
    where: {
      theater_id: theaterId,
      film_id: filmId
    }
  });
};

module.exports = {
  getScheduleByCinema,
  getScheduleByTheater 
};