import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'formulir_output.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController namaController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglDaftarController = TextEditingController();

  // Dropdown Kelas (5 Pilihan Kelas)
  String? _pilihKelas;
  final List<String> daftarKelas = [
    "Kelas RPL 1",
    "Kelas RPL 2",
    "Kelas RPL 3",
    "Kelas RPL 4",
    "Kelas RPL 5",
  ];

  // Checkbox Eskul (2 Pilihan)
  bool _eskulPramuka = false;
  bool _eskulPaskibra = false;
  String? _eskulError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir Pendaftaran"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[50],
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Formulir Siswa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // 1. Nama Lengkap
                        TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            labelText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input Nama Lengkap';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // 2. No Telepon (Keyboard Handphone)
                        TextFormField(
                          controller: telpController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            labelText: "No. Telepon",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input No. Telepon';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // 3. Email (Keyboard Email)
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input Email';
                            }
                            if (!value.contains('@')) {
                              return 'Format email tidak valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // 4. Dropdown Kelas (5 Pilihan)
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Pilih Kelas",
                            border: OutlineInputBorder(),
                          ),
                          value: _pilihKelas,
                          items: daftarKelas
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _pilihKelas = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih salah satu kelas';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // 5. Tanggal Pendaftaran (DatePicker)
                        TextFormField(
                          controller: tglDaftarController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Tanggal Pendaftaran",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih Tanggal Pendaftaran';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                tglDaftarController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 18),

                        // 6. Checkbox Ekstrakurikuler (2 Pilihan)
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pilihan Ekstrakurikuler",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text("Pramuka"),
                          value: _eskulPramuka,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              _eskulPramuka = value ?? false;
                              _eskulError = null;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Paskibra"),
                          value: _eskulPaskibra,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              _eskulPaskibra = value ?? false;
                              _eskulError = null;
                            });
                          },
                        ),
                        if (_eskulError != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              _eskulError!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),

                        const SizedBox(height: 24),

                        // Tombol Simpan
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[800],
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: _submit,
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    // Validasi minimal 1 eskul dipilih
    if (!_eskulPramuka && !_eskulPaskibra) {
      setState(() {
        _eskulError = 'Pilih minimal satu ekstrakurikuler';
      });
    }

    if (!isValid || (!_eskulPramuka && !_eskulPaskibra)) return;

    // Menggabungkan pilihan eskul yang dicentang
    List<String> selectedEskul = [];
    if (_eskulPramuka) selectedEskul.add("Pramuka");
    if (_eskulPaskibra) selectedEskul.add("Paskibra");

    // Navigasi ke Halaman Output
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormulirOutput(
          nama: namaController.text,
          noTelp: telpController.text,
          email: emailController.text,
          kelas: _pilihKelas!,
          tglDaftar: tglDaftarController.text,
          eskul: selectedEskul.join(", "),
        ),
      ),
    );
  }
}