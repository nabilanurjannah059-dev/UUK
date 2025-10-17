import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color pinkSoft = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Peminjaman Buku Perpustakaan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('SMKN 8 Malang',
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 18),
            const Text('Deskripsi Aplikasi',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              'Aplikasi ini dibuat khusus untuk mempermudah warga SMKN 8 Malang '
              'dalam mengakses layanan perpustakaan secara digital. '
              'Dengan tampilan yang simpel dan mudah dipahami, pengguna bisa '
              'langsung melakukan beberapa hal penting seputar peminjaman buku.\n\n'
              'Fitur yang tersedia di dalam aplikasi:\n\n'
              '• Riwayat Peminjaman\n'
              '  Melihat daftar buku yang pernah dipinjam dan kapan harus dikembalikan.\n\n'
              '• Input Peminjaman\n'
              '  Mengisi data peminjaman buku baru secara langsung lewat aplikasi.\n\n'
              'Aplikasi ini cocok digunakan oleh siswa, guru, maupun staf perpustakaan '
              'untuk mempercepat dan mempermudah proses peminjaman buku tanpa harus '
              'ribet dengan pencatatan manual.',
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 18),
            const Text('Pembuat', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              'Nama: Nabila N. J.\nKelas: XI RPL A\nNomor Absen: 22',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  color: pinkSoft,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withValues(alpha: 0.3),

                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  'Terima kasih',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
