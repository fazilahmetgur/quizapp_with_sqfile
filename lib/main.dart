import 'package:flutter/material.dart';
import 'package:quiz_app_uygulamasi/quizekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key,});


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
 
        title: const Text('Quiz Uygulaması'),
        centerTitle: true,
      ),
      body:  Center(
   
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
          const Text('Quiz Uygulaması', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizEkrani()));

          }, child: const Text('Başla'),
          
          ),
          
           
          ],
        ),
      ),
    );
  }
}
