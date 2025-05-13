module.exports = (sequelize, DataTypes) => {
    const Genre = sequelize.define('Genre', {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true
        },
        name: {
          type: DataTypes.STRING(50),
          allowNull: false
        }
    }, {
        tableName: 'genres',
        timestamps: false
    });

    return Genre;
};