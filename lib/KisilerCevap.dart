import 'package:flutter_http/Kisiler.dart';

class KisilerCevap {

  late int success;
  late List<Kisiler> kisilerListesi;

  KisilerCevap(this.success, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String,dynamic>json){

    var jsonArray = json["kisiler"] as List;

    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();
    return KisilerCevap(json["success"] as int, kisilerListesi);


  }
}