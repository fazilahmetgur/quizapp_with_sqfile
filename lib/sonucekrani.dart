// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
 
  int dogruSayisi;
   SonucEkrani({super.key,  required this.dogruSayisi});


  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sonuç Ekranı"),
      centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("${widget.dogruSayisi} DOGRU ${5-widget.dogruSayisi} YANLIŞ", style: const TextStyle(fontSize: 30),),
             Text(" % ${(widget.dogruSayisi*100)~/5} BAŞARI", style: const TextStyle(fontSize: 30),),
            SizedBox(
              width: 150,height: 50,
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);


              }, 
              child: const Text("TEKRAR DENE"),),
            ),

          ],
        ),
      ),
    );
  }
}