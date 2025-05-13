'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('theaters', [
      {
        cinema_id: 1,
        name: 'Studio 1',
        capacity: 200,
        theater_type: 'Regular',
      },
      {
        cinema_id: 2,
        name: 'Studio 1',
        capacity: 150,
        theater_type: 'Regular',
      },
      {
        cinema_id: 3,
        name: 'Studio 1',
        capacity: 180,
        theater_type: 'Regular',
      },
      {
        cinema_id: 4,
        name: 'Studio 1',
        capacity: 220,
        theater_type: 'Regular',
      },
      {
        cinema_id: 5,
        name: 'Studio 1',
        capacity: 250,
        theater_type: 'Regular',
      },
      {
        cinema_id: 6,
        name: 'Studio 1',
        capacity: 200,
        theater_type: 'Regular',
      },
      {
        cinema_id: 7,
        name: 'Studio 1',
        capacity: 180,
        theater_type: 'Regular',
      },
      {
        cinema_id: 8,
        name: 'Studio 1',
        capacity: 160,
        theater_type: 'Regular',
      },
      {
        cinema_id: 9,
        name: 'Studio 1',
        capacity: 200,
        theater_type: 'Regular',
      },
      {
        cinema_id: 10,
        name: 'Studio 1',
        capacity: 220,
        theater_type: 'Regular',
      }
    ]);
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.bulkDelete('theaters', null, {});
  }
};
