// ignore_for_file: unrelated_type_equality_checks

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_app_uygulamasi/Bayraklardao.dart';
import 'package:quiz_app_uygulamasi/bayraklar.dart';
import 'package:quiz_app_uygulamasi/sonucekrani.dart';


class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular=<Bayraklar>[];
  var yanlisSecenekler=<Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler=HashSet<Bayraklar>();

  int soruSayaci=0;
  int dogruSayaci=0;
  int yanlisSayaci=0;

  String bayrakResimAdi="placeholder.png";
  String buttonAyazi="";
  String buttonByazi="";
  String buttonCyazi="";
  String buttonDyazi="";

  @override
  void initState() {
    super.initState();
    sorulariAl();

  }
  Future<void>sorulariAl()async{
    sorular=await Bayraklardao().rastgele5Getir();
    soruYukle();
  }
  Future<void>soruYukle()async{
    dogruSoru=sorular[soruSayaci];
    bayrakResimAdi=dogruSoru.bayrak_resim;

    yanlisSecenekler=await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi=tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi=tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi=tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi=tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {
      
    });




  }
  void soruSayacKontrol(){
    soruSayaci=soruSayaci+1;
    if(soruSayaci!=5){
      soruYukle();

    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SonucEkrani(dogruSayisi: dogruSayaci)));

    }
  }
  void dogruKontrol(String buttonYazi){
    if(dogruSoru.bayrak_id==buttonYazi){
      dogruSayaci=dogruSayaci+1;
    }else{
      yanlisSayaci=yanlisSayaci+1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Ekranı"),
      centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Doğru: $dogruSayaci', style: const TextStyle(fontSize: 18),),
                Text("Yanlış: $yanlisSayaci", style: const TextStyle(fontSize: 18),),
              ],
            ),
            soruSayaci!=5 ? Text("${soruSayaci+1}", style: const TextStyle(fontSize: 30),): const Text("5. Soru", style: TextStyle(fontSize: 30),),
            Image.asset("resimler/$bayrakResimAdi"),
            const SizedBox(width: 150, height: 50,),
            ElevatedButton(onPressed: (){
             dogruKontrol(buttonAyazi);
             soruSayacKontrol();
            }, 
            child:  Text(buttonAyazi, style: const TextStyle(fontSize: 18),),
            ),
            const SizedBox(width: 150, height: 50,),
            ElevatedButton(onPressed: (){
              dogruKontrol(buttonByazi);
              soruSayacKontrol();
             
            }, 
            child:  Text(buttonByazi, style: const TextStyle(fontSize: 18),),
            
            
            ),
            const SizedBox(width: 150, height: 50,),
            ElevatedButton(onPressed: (){
             dogruKontrol(buttonCyazi);
             soruSayacKontrol();
            },
            child:  Text(buttonCyazi, style: const TextStyle(fontSize: 18),),
            
            
            ),
            const SizedBox(width: 150, height: 50,),
             ElevatedButton(onPressed: (){
              dogruKontrol(buttonDyazi);
              soruSayacKontrol();
             }, 
            child:  Text(buttonDyazi, style: const TextStyle(fontSize: 18),),
            
            
            ),


          ],
        ),
      ),
    );

  }
}