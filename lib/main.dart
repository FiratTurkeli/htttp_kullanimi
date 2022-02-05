import 'package:flutter/material.dart';
import 'package:flutter_http/Kisiler.dart';
import 'package:flutter_http/KisilerCevap.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Kisiler> parseKisilerCevap(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;

  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse ("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");

    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriGoster() async {
    var liste = await tumKisiler();
    for(var k in liste){
      print("*************");
      print("Kisi ad : ${k.kisi_ad}");
      print("Kisi tel : ${k.kisi_tel}");

    }
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
    var url = Uri.parse ("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var veri = {"kisi_ad : $aramaKelimesi"};
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriAra() async {
    var liste = await kisilerAra("a");
    for(var k in liste){
      print("*************");
      print("Kisi ad : ${k.kisi_ad}");
      print("Kisi tel : ${k.kisi_tel}");

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisileriGoster();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
