module.exports = ( sequelize, DataTypes) => {
    const Movie = sequelize.define('Movie', {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true
        },
        title: {
          type: DataTypes.STRING,
          allowNull: false
        },
        original_title: DataTypes.STRING,
        poster_path: DataTypes.STRING,
        backdrop_path: DataTypes.STRING,
        overview: DataTypes.TEXT,
        release_date: DataTypes.DATEONLY,
        runtime: DataTypes.INTEGER,
        vote_average: DataTypes.DECIMAL(3, 1),
        vote_count: DataTypes.INTEGER,
        tmdb_popularity: DataTypes.DECIMAL(10, 3),
        original_language: DataTypes.STRING(10),
        adult: {
          type: DataTypes.BOOLEAN,
          defaultValue: false
        }
    }, {
        tableName: 'movies',
        timestamps: false,
        indexes: [
            {
              name: 'idx_movies_popularity',
              fields: [{ name: 'tmdb_popularity', order: 'DESC' }]
            },
            {
              name: 'idx_movies_release',
              fields: [{ name: 'release_date', order: 'DESC' }]
            }
        ]
    });

    Movie.associate = (models) => {
        Movie.hasMany(models.Schedule, { foreignKey: 'film_id' });
    };

    return Movie;
};