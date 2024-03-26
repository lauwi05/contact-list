// import 'package:kalkulator/column_widget.dart';
import 'package:kalkulator/ui/produk_form.dart';
import 'package:kalkulator/ui/produk_page.dart';
import 'package:kalkulator/uts/detail_mahasiswa.dart';
import 'package:kalkulator/uts/form_mahasiswa.dart';
import 'package:kalkulator/uts/page_mahasiswa.dart';
import 'package:kalkulator/tugas/form_nama.dart';
import 'package:kalkulator/tugas/detail.dart';
import 'package:kalkulator/tugas/page_data.dart';
import 'package:flutter/material.dart'; 


void main() { 
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key); 

  @override 
  Widget build(BuildContext context) { 
    return const MaterialApp( 
      title: "Percobaan Flutter Saya", 
      home: PageData(),

    ); 
  } 
}