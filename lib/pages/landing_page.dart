import 'package:flutter/material.dart';//menginport materi desaign,scaffold,teks,button

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  //context digunakan untuk mengakses tema,navigasi,dsb
  Widget build(BuildContext context) { 
    final Color pinkSoft = Theme.of(context).colorScheme.primary;
    return Scaffold( //kerangka dasar punya body,appbar,
      body: SafeArea( //memastikan isi halaman tidak tertutup status bar
        child: Padding( //supaya card tidak nempel dengan tepi
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
          child: Column( // menata elemen secara vertikal dari atas ke bawah
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Peminjaman Buku',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6), //sizebok memberi jarak antar elemen
              const Text(
                'Perpustakaan SMKN 8 Malang',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              
              Container( //membuat kotak warna dasar pink
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: pinkSoft,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.book, color: Colors.white, size: 60),//Icons.book ikon bawaan dari flutter
              ),

              const SizedBox(height: 20),

              // Teks di bawah gambar
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi ini membantu proses peminjaman buku di SMKN 8 Malang agar lebih mudah dan cepat.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),

              const Spacer(),

              // Tombol dan link
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('Mulai'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: const Text(
                  'Tentang Aplikasi',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
