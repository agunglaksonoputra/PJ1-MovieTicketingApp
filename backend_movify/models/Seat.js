module.exports = (sequelize, DataTypes) => {
    const Seat = sequelize.define('Seat', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        theater_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'theaters',
                key: 'id'
            }
        },
        seat_label: DataTypes.STRING(10),
        row: DataTypes.STRING(1),
        col: DataTypes.INTEGER
    }, {
        tableName: 'seats',
        timestamps: false
    });

    Seat.associate = (models) => {
        Seat.hasOne(models.BookedSeat, { foreignKey: 'seat_id' });
    };

    return Seat;
};