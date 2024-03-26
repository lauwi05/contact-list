import 'package:flutter/material.dart';
import 'package:kalkulator/tugas/detail.dart';
import 'package:kalkulator/tugas/form_nama.dart';

class PageData extends StatefulWidget {
  const PageData({Key? key}) : super(key: key);

  @override
  _PageDataState createState() => _PageDataState();
}

class _PageDataState extends State<PageData> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  List<Map<String, String>> dataList = [
    {"nama": "Laurence Benedicta", "no_HP": "087825357938"},
    {"nama": "Kevin Keefe", "no_HP": "087840748324"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pengisi Form"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormNama()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Cari",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchText = "";
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: dataList
                  .where((orang) =>
                      orang['nama']!.toLowerCase().contains(searchText.toLowerCase()))
                  .map((orang) => OrangYangSudahTerdaftar(
                        nama: orang['nama'],
                        no_HP: orang['no_HP'],
                      ))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Navigasi ke halaman FormNama untuk menambahkan data baru
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormNama()));

              // Jika result tidak null, tambahkan data baru ke dataList
              if (result != null && result is Map<String, String>) {
                setState(() {
                  dataList.add(result);
                });
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

class OrangYangSudahTerdaftar extends StatelessWidget {
  final String? nama;
  final String? no_HP;

  const OrangYangSudahTerdaftar({Key? key, this.nama, this.no_HP})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(nama.toString()),
          subtitle: Text(no_HP.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      nama: nama,
                      no_HP: no_HP,
                    )));
      },
    );
  }
}
