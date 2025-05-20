const bookingService = require('../services/bookingsService');

const getBookingByScheduleId = async (req, res) => {
    const { scheduleId } = req.params;
    try {
        console.log("Entering getBookingByScheduleId");
        const result = await bookingService.getBookingByScheduleId(scheduleId);
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
};



module.exports = {
    getBookingByScheduleId,
};