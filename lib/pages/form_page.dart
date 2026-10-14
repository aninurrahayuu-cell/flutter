import 'package:flutter/material.dart';

void main() {
  runApp(const FormPage());
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();

  // Controller terpisah untuk setiap input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Variabel pendukung untuk Jenis Kelamin (Radio) dan Agama (Dropdown/Pilihan)
  String? _selectedGender;
  String? _selectedReligion;
  final List<String> _religionList = ['Islam', 'Kristen', 'Katolik', 'Hindu', 'Buddha', 'Konghucu'];

  var _outputName = '';

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _outputName = _nameController.text;
    });
    print("Nama Lengkap : ${_nameController.text}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama : ${_nameController.text}")),
    );
    _clearInput();
  }

  void _clearInput() {
    _nameController.clear();
    _dateController.clear();
    _addressController.clear();
    setState(() {
      _selectedGender = null;
      _selectedReligion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biodata')),
      body: SingleChildScrollView( // Ditambahkan agar form bisa di-scroll ke bawah
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nama
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // 2. Tanggal Lahir (Date Picker)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                      setState(() {
                        _dateController.text = formattedDate;
                      });
                    }
                  },
                  validator: (value) => value == null || value.isEmpty ? 'Tanggal lahir harus diisi' : null,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),

              // 3. Jenis Kelamin (Radio Button)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kelamin',
                    border: OutlineInputBorder(),
                  ),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Laki-laki'),
                        value: 'Laki-laki',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Perempuan'),
                        value: 'Perempuan',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // 4. Alamat (Textarea / Multi-line TextField)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _addressController,
                  maxLines: 4, // Membuat TextField menjadi Textarea
                  validator: (value) => value == null || value.isEmpty ? 'Alamat tidak boleh kosong' : null,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ),

              // 5. Agama (Dropdown pilihan pengganti checkbox tunggal)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedReligion,
                  decoration: const InputDecoration(
                    labelText: 'Agama',
                    border: OutlineInputBorder(),
                  ),
                  items: _religionList.map((String religion) {
                    return DropdownMenuItem<String>(
                      value: religion,
                      child: Text(religion),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedReligion = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Agama' : null,
                ),
              ),

              const SizedBox(height: 10),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  child: const Text("simpan"),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Nama : ${_outputName.isEmpty ? "-" : _outputName}',
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}