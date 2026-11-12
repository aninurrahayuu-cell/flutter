import 'package:flutter/material.dart';

class FormulirOutput extends StatelessWidget {
  final String nama, noTelp, email, kelas, tglDaftar, eskul;

  const FormulirOutput({
    super.key,
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.kelas,
    required this.tglDaftar,
    required this.eskul,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Hasil Pendaftaran"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textWidget("Nama Lengkap", nama),
                  _textWidget("No. Telepon", noTelp),
                  _textWidget("Email", email),
                  _textWidget("Kelas", kelas),
                  _textWidget("Tgl Pendaftaran", tglDaftar),
                  _textWidget("Ekstrakurikuler", eskul),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}