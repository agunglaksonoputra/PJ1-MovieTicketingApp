const { DataTypes } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
    const Schedule = sequelize.define('Schedule', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        film_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'movies',
                key: 'id'
            }
        },
        title: {
            type: DataTypes.STRING,
            allowNull: false
        },
        theater_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'theaters',
                key: 'id'
            }
        },
        date: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        start_time: {
            type: DataTypes.TIME,
            allowNull: false
        },
        price: {
            type: DataTypes.DECIMAL(10,2),
            allowNull: false
        }
    }, {
        tableName: 'schedules',
        timestamps: true  
    });

    Schedule.associate = (models) => {
        Schedule.belongsTo(models.Theater, { foreignKey: 'theater_id' });
        Schedule.belongsTo(models.Movie, { foreignKey: 'film_id' });
    };

     return Schedule;
};