'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('seats', { 
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      theater_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'theaters',
          key: 'id'
        }
      },
      seat_label: Sequelize.STRING(10),
      row: Sequelize.STRING(1),
      col: Sequelize.INTEGER
    });
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('seats');
  }
};
