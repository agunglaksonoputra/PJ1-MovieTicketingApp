module.exports = (sequelize, DataTypes) => {
    const Cinema = sequelize.define('Cinema', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        address: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        city: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        phone: DataTypes.STRING(20),
        email: DataTypes.STRING(100),
    }, {
        tableName: 'cinemas',
        timestamps: true
    });

    Cinema.associate = (models) => {
        Cinema.hasMany(models.Theater, { foreignKey: 'cinema_id' });
    };

    return Cinema;
};