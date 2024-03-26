import 'package:flutter/material.dart';
import 'package:kalkulator/tugas/page_data.dart';

class FormNama extends StatefulWidget {
  const FormNama({Key? key}) : super(key: key);

  @override
  _FormNamaState createState() => _FormNamaState();
}

class _FormNamaState extends State<FormNama> {
  final _namaTextboxController = TextEditingController();
  final _no_HPTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      backgroundColor: Colors.white, // Ubah warna background
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0), // Tambahkan padding
        child: Column(
          children: [
            _buildTextFieldWithIcon(
              labelText: "Nama",
              controller: _namaTextboxController,
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            _buildTextFieldWithIcon(
              labelText: "No HP",
              controller: _no_HPTextboxController,
              icon: Icons.person,
            ),
            SizedBox(height: 20),
            _buildButton("Simpan", Colors.blue, _saveData), // Customize button
            SizedBox(height: 10),
            _buildButton("Clear", Colors.yellow, _clearForm), // Customize button
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required String labelText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }

  Widget _buildButton(String text, Color color, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _saveData() {
    String nama = _namaTextboxController.text;
    String no_HP = _no_HPTextboxController.text;

    // Kirim kembali data ke halaman sebelumnya (PageData)
    Navigator.pop(context, {
      'nama': nama,
      'no_HP': no_HP,
    });
  }

  void _clearForm() {
    _namaTextboxController.clear();
    _no_HPTextboxController.clear();
  }
}
