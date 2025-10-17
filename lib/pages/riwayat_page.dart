import 'package:flutter/material.dart';
import '../data.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
 
  void _hapusData(int index) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi'),
        content:
            const Text('Apakah Anda yakin ingin menghapus riwayat peminjaman ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Ya, Hapus'),
          ),
        ],
      ),
    );

    if (konfirmasi == true) {
      setState(() {
        riwayatDummy.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Riwayat peminjaman berhasil dihapus.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Peminjaman')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: riwayatDummy.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada riwayat peminjaman.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            : ListView.builder(
                itemCount: riwayatDummy.length,
                itemBuilder: (ctx, i) {
                  final r = riwayatDummy[i];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primary,
                        child: const Icon(Icons.book, color: Colors.white),
                      ),
                      title: Text(
                        r.judul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        'Peminjam: ${r.peminjam}\n'
                        'Pinjam: ${r.tanggalPinjam} • Kembali: ${r.tanggalKembali}',
                        style: const TextStyle(fontSize: 13.5, height: 1.3),
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 253, 93, 93)),
                        tooltip: 'Hapus Riwayat',
                        onPressed: () => _hapusData(i),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
