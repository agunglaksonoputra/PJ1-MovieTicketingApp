module.exports = ( sequelize, DataTypes) => {
    const MovieGenre = sequelize.define('MovieGenre', {
        movie_id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          references: {
            model: 'movies',
            key: 'id'
          }
        },
        genre_id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          references: {
            model: 'genres',
            key: 'id'
          }
        }
    }, {
        tableName: 'movie_genres',
        timestamps: false
    });

    return MovieGenre;
};