module.exports = (sequelize, DataTypes) => {
    const Booking = sequelize.define('Booking', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        booking_reference: {
            type: DataTypes.STRING(20),
            unique: true,
            allowNull: false
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'users',
                key: 'id'
            }
        },
        schedule_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'schedules',
                key: 'id'
            }
        },
        total_amount: {
            type: DataTypes.DECIMAL(10,2),
            allowNull: false
        },
        payment_method: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        payment_status: {
            type: DataTypes.ENUM('pending', 'paid', 'failed', 'refunded'),
            defaultValue: 'pending',
        },
        booking_status: {
            type: DataTypes.ENUM('active', 'used', 'cancelled', 'expired'),
            defaultValue: 'active',
        }
    }, {
        tableName: 'bookings',
        timestamps: true
    });

    return Booking;
};