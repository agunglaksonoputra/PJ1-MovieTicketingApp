const { Sequelize} = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASS, {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: 'mysql',
  logging: false,
});

const connectionDatabase = async () => {
  try {
    await sequelize.authenticate();
    console.log('Koneksi ke database berhasil!');
  } catch (error) {
    console.error('Tidak dapat terhubung ke database:', error);
  }
};

module.exports = { sequelize, connectionDatabase };
