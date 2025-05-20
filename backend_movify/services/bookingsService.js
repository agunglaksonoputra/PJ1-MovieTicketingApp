const { Booking, BookedSeat, Seat } = require('../models');

const getBookingByScheduleId = async (scheduleId) => {
    return await Booking.findAll({
        where: { schedule_id: scheduleId },
        include: {
            model: BookedSeat,
            attributes: ['id', 'seat_id'],
        }
    });
};

const getSeatByTheater = async(theaterId) => {
    return await Seat.findAll({
        where: { theater_id: theaterId },
        attributes: ['id'],
    });
}


module.exports = {
  getBookingByScheduleId,
  getSeatByTheater  
};