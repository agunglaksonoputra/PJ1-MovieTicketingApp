'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('theaters', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      cinema_id: {
          type: Sequelize.INTEGER,
          allowNull: false,
          references: {
              model: 'cinemas',
              key: 'id'
          }
      },
      name: {
          type: Sequelize.STRING(50),
          allowNull: false
      },
      capacity: {
          type: Sequelize.INTEGER,
          allowNull: false
      },
      theater_type: Sequelize.STRING(50)
    });
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('theaters');
  }
};
