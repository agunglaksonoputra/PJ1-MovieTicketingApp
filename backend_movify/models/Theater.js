module.exports = (sequelize, DataTypes) => {
    const Theater = sequelize.define('Theater', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        cinema_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'cinemas',
                key: 'id'
            }
        },
        name: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        capacity: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        theater_type: DataTypes.STRING(50)
    }, {
        tableName: 'theaters',
        timestamps: false
    });

    Theater.associate = (models) => {
        Theater.belongsTo(models.Cinema, { foreignKey: 'cinema_id' });
        Theater.hasMany(models.Schedule, {foreignKey: 'theater_id'});
        Theater.hasMany(models.Seat, {foreignKey: 'theater_id'});
    };

    return Theater;
};