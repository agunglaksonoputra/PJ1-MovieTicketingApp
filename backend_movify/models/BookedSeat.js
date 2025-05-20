module.exports = (sequelize, DataTypes) => {
    const BookedSeat = sequelize.define('BookedSeat', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        booking_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'bookings',
                key: 'id',
                onDelete: 'CASCADE',
                onUpdate: 'CASCADE'
            }
        },
        schedule_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'schedules',
                key: 'id',
                onDelete: 'CASCADE', 
                onUpdate: 'CASCADE'
            },
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

    BookedSeat.associate = (models) => {
        BookedSeat.belongsTo(models.Booking, { foreignKey: 'booking_id' });
        BookedSeat.belongsTo(models.Schedule, { foreignKey: 'schedule_id' });
    };

    return BookedSeat;
};