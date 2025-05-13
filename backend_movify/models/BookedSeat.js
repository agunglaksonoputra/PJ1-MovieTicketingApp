module.exports = (sequelize, DataTypes) => {
    const BookedSeat = sequelize.define('BookedSeat', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        booking_id: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        seat_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'seats',
                key: 'id'
            }
        }
    }, {
        tableName: 'booked_seats',
        timestamps: true,
        updatedAt: false
    });

    return BookedSeat;
};