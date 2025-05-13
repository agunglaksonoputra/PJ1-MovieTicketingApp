const { Op } = require("sequelize");
const { Cinema, Theater, Movie, Schedule, Seat } = require("../models");

const getAllCinema = async () => {
  return await Cinema.findAll();
};

const getCinemasByMovieAndCity = async (movieId, city) => {
  return await Movie.findByPk(movieId, {
    include: [
      {
        model: Schedule,
        attributes: ['id', 'title', 'date', 'start_time', 'price'],
        include: [
          {
            model: Theater,
            include: [
              {
                model: Cinema,
                attributes: ['id', 'name', 'address', 'city'],
                where: {
                  city: {
                    [Op.like]: `%${city}%`
                  }
                }
              }
            ]
          }
        ]
      }
    ]
  });
};

const getTheaterSeat = async (theaterId) => {
  return await Theater.findByPk(theaterId, {
    include: {
      model: Seat
    }
  });
};

module.exports = {
  getAllCinema,
  getCinemasByMovieAndCity,
  getTheaterSeat  
};