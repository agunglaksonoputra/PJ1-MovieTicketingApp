'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('cinemas', [
      {
        name: 'CGV Paris Van Java',
        address: 'Paris Van Java Mall Lt. 1, Jl. Sukajadi No. 137-139',
        city: 'Bandung',
        phone: '(022) 82063608',
        email: 'cs@cgv.id',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'CGV Bandung Electronic Center',
        address: 'Bandung Electronic Center Lt. 3A, Jl. Purnawarman No. 13-15',
        city: 'Bandung',
        phone: '(022) 4267408',
        email: 'cs@cgv.id',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'CGV Miko Mall',
        address: 'Miko Mall Lt. 2, Jl. Kopo Cirangrang No. 599',
        city: 'Bandung',
        phone: '(022) 86012427',
        email: 'cs@cgv.id',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'CGV 23 Paskal Shopping Center',
        address: '23 Paskal Shopping Center Lt. 3, Jl. Pasirkaliki No. 25-27',
        city: 'Bandung',
        phone: '(022) 86064129',
        email: 'cs@cgv.id',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'XXI Ciwalk',
        address: 'Cihampelas Walk Lt. 2, Jl. Cihampelas No. 160',
        city: 'Bandung',
        phone: '(022) 2061856',
        email: 'customercare@21cineplex.com',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'XXI Bandung Trade Center',
        address: 'Bandung Trade Center Lt. 3A, Jl. Dr. Djunjunan No. 143-149',
        city: 'Bandung',
        phone: '(022) 6128686',
        email: 'customercare@21cineplex.com',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'XXI Trans Studio Mall',
        address: 'Trans Studio Mall Lt. 2, Jl. Gatot Subroto No. 289',
        city: 'Bandung',
        phone: '(022) 91280021',
        email: 'customercare@21cineplex.com',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'XXI Braga City Walk',
        address: 'Braga City Walk Lt. 3, Jl. Braga No. 99-101',
        city: 'Bandung',
        phone: '(022) 4260505',
        email: 'customercare@21cineplex.com',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'XXI Jatos',
        address: 'Jatinangor Town Square Lt. 2, Jl. Raya Jatinangor KM 20.5',
        city: 'Bandung',
        phone: '(022) 7781780',
        email: 'customercare@21cineplex.com',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'Cinemaxx Istana Plaza',
        address: 'Istana Plaza Lt. 3, Jl. Pasirkaliki No. 121-123',
        city: 'Bandung',
        phone: '(022) 6006117',
        email: 'info@cinemaxxtheater.com',
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ]);
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.bulkDelete('cinemas', null, {});
  }
};
