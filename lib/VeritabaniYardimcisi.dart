// ignore_for_file: unnecessary_import, file_names

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class VeritabaniYardimcisi{
  static const String veritabaniAdi= "bayrakquiz.sqlite";
  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu= join(await getDatabasesPath(), veritabaniAdi);
    if (await databaseExists(veritabaniYolu)){
      // ignore: avoid_print
      print("Veri tAbanı Zaten var.Kopyalamaya Gerek Yok");
    }else{
      //assetten veri tabani alınması işlemi
      ByteData data= await rootBundle.load("veritabani/$veritabaniAdi");
      //veri tabani kopyalama için byyte dönüşümü
      List<int>bytes=data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //veri tabanı kopyalandı
      await File(veritabaniYolu).writeAsBytes(bytes,flush:true);
      // ignore: avoid_print
      print("Veri Tabanı Kopyyalandı");
    }
    return openDatabase(veritabaniYolu);
  }
}