const { Seat } = require('../models');

async function createSeatsForTheater(theaterId, rows = [], cols) {
  try {
    const seatData = [];

    rows.forEach(rowLabel => {
      for (let i = 1; i <= cols; i++) {
        seatData.push({
          theater_id: theaterId,
          seat_label: `${rowLabel }${i}`,
          row: rowLabel,
          col: i
        });
      }
    });

    await Seat.bulkCreate(seatData);
    console.log(`Seats untuk theater ${theaterId} berhasil dibuat.`);
  } catch (error) {
    console.error(`Gagal membuat seat untuk theater ${theaterId}:`, error);
  }
};

async function main() {
    const seatRow = ['A', 'B', 'C', 'D', 'E'];
    try {
        for (let theaterId = 1; theaterId <= 10; theaterId++) {
            await createSeatsForTheater(theaterId, seatRow, 10);
        }
        console.log('Proses insert Seat selesai')
    } catch (error) {
        console.error('Gagal menjalankan proses utama:', error);
    }
}

main();