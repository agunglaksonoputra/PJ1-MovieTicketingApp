const { Op, where } = require("sequelize");
const { Cinema, Theater, Movie, Schedule, Seat, BookedSeat } = require("../models");
const Booking = require("../models/Booking");

const getAllCinema = async () => {
  return await Cinema.findAll();
};

const getCinemaByCity = async (city) => {
  return await Cinema.findAll({
    where: {
      city: city
    }
  });
};

const getTheaterByCinema = async (cinemaId) => {
  return await Theater.findAll({
    where: {
      cinema_id: cinemaId
    }
  });
};

const getCinemaShowingMovies = async (city, movieId) => {
  return await Cinema.findAll({
    where: {
      city: city
    },
    include: [
      {
        model: Theater,
        attributes: ['id', 'name'],
        include: [
          {
            model: Schedule,
            attributes: ['id', 'title', 'date', 'start_time', 'price'],
            where: {
              film_id: movieId
            },
            required: true
          }
        ],
        required: true
      }
    ]
  });
};

// const getTheaterSeat = async (theaterId) => {
//   return await Seat.findAll({
//     where: {
//       theater_id: theaterId
//     },
//     include: [
//       {
//         model: BookedSeat,
//         attributes: ['id', 'booking_id', 'schedule_id', 'seat_id'],
//         include: [
//           {
//             model: Booking,
//             where: {
//               payment_status: 'paid'
//             },
//             required: true
//           }
//         ]
//       },
//       {
//         model: Schedule,
//         where: {

//         }
//       }
//     ]
//   });
// };

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
  return await Seat.findAll({
    where: { theater_id: theaterId },
  });
};

const getSeatBookedBySchedule = async(scheduleId) => {
  return await BookedSeat.findAll({
    where: { schedule_id: scheduleId }
  });
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