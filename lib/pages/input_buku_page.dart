import 'package:flutter/material.dart';
import '../data.dart';

class InputBukuPage extends StatefulWidget {
  const InputBukuPage({super.key});

  @override
  State<InputBukuPage> createState() => _InputBukuPageState();
}

class _InputBukuPageState extends State<InputBukuPage> {
  final _formKey = GlobalKey<FormState>();
  final _judulCtrl = TextEditingController();
  final _peminjamCtrl = TextEditingController();
  final _pinjamCtrl = TextEditingController();
  final _kembaliCtrl = TextEditingController();

  // warna pink lembut
  final Color pinkSoft = const Color(0xFFFFC1E3);

  
  Future<void> _pilihTanggal(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(3000), 
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: pinkSoft, 
              onPrimary: Colors.black, 
              onSurface: Colors.black87, 
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        controller.text =
            "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      riwayatDummy.add(BorrowRecord(
        id: id,
        judul: _judulCtrl.text,
        peminjam: _peminjamCtrl.text,
        tanggalPinjam: _pinjamCtrl.text,
        tanggalKembali: _kembaliCtrl.text,
      ));

      // tampilkan dialog konfirmasi
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          title: const Text(
            'Berhasil',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Data buku berhasil disimpan.',
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFFFC1E3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );

      // kosongkan form setelah simpan
      setState(() {
        _judulCtrl.clear();
        _peminjamCtrl.clear();
        _pinjamCtrl.clear();
        _kembaliCtrl.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Data Buku')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulCtrl,
                decoration: const InputDecoration(labelText: 'Judul Buku'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Isi judul buku' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _peminjamCtrl,
                decoration: const InputDecoration(labelText: 'Nama Peminjam'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Isi nama peminjam' : null,
              ),
              const SizedBox(height: 10),

              // Tanggal Pinjam
              TextFormField(
                controller: _pinjamCtrl,
                readOnly: true,
                onTap: () => _pilihTanggal(context, _pinjamCtrl),
                decoration: InputDecoration(
                  labelText: 'Tanggal Pinjam',
                  suffixIcon: Icon(Icons.calendar_today, color: pinkSoft),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih tanggal pinjam' : null,
              ),
              const SizedBox(height: 10),

              // Tanggal Kembali
              TextFormField(
                controller: _kembaliCtrl,
                readOnly: true,
                onTap: () => _pilihTanggal(context, _kembaliCtrl),
                decoration: InputDecoration(
                  labelText: 'Tanggal Kembali',
                  suffixIcon: Icon(Icons.calendar_today, color: pinkSoft),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih tanggal kembali' : null,
              ),

              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _simpan,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Simpan'),
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
