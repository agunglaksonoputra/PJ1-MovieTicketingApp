'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('movies', {
      id: {
            type: Sequelize.INTEGER,
            primaryKey: true
          },
          title: {
            type: Sequelize.STRING,
            allowNull: false
          },
          original_title: Sequelize.STRING,
          poster_path: Sequelize.STRING,
          backdrop_path: Sequelize.STRING,
          overview: Sequelize.TEXT,
          release_date: Sequelize.DATEONLY,
          runtime: Sequelize.INTEGER,
          vote_average: Sequelize.DECIMAL(3, 1),
          vote_count: Sequelize.INTEGER,
          tmdb_popularity: Sequelize.DECIMAL(10, 3),
          original_language: Sequelize.STRING(10),
          adult: {
            type: Sequelize.BOOLEAN,
            defaultValue: false
          }
    });
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('movies');
  }
};
