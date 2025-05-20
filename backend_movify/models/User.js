module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },
        phone: DataTypes.STRING(20),
        email: DataTypes.STRING(100),
        password: DataTypes.STRING
    }, {
        tableName: 'users',
        timestamps: true
    });

    return User;
};