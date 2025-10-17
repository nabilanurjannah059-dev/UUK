class BorrowRecord {
  String id;
  String judul;
  String peminjam;
  String tanggalPinjam;
  String tanggalKembali;

  BorrowRecord({
    required this.id,
    required this.judul,
    required this.peminjam,
    required this.tanggalPinjam,
    required this.tanggalKembali,
  });
}

// Data dummy awal
List<BorrowRecord> riwayatDummy = [
  BorrowRecord(
    id: '1',
    judul: 'Pemrograman Dasar dengan Dart',
    peminjam: 'Dina',
    tanggalPinjam: '2025-09-01',
    tanggalKembali: '2025-09-08',
  ),
  BorrowRecord(
    id: '2',
    judul: 'Desain UI/UX untuk Pemula',
    peminjam: 'Raka',
    tanggalPinjam: '2025-09-03',
    tanggalKembali: '2025-09-10',
  ),
];
