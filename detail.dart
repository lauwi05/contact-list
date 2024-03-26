import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
final String? nama;
final String? no_HP;

const Detail({Key? key, this.nama, this.no_HP})
: super(key: key);

@override
_DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
@override
Widget build(BuildContext context) {
return Scaffold(

appBar: AppBar(
title: const Text('Detail'),
),
body: Column(
children: [
Text("Nama : " + widget.nama.toString()),
Text("No HP : " + widget.no_HP.toString()),

],
),
);
}
}