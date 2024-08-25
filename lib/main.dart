import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:flutter/painting.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Http json Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final String url='http://10.0.2.2:3000/courses';
List<dynamic> _courses =[];
bool loading = true;

@override
void initState(){
  getCourses();
  super.initState();
}

Future<void> getCourses() async {
  var reponse = await http.get(Uri.parse(url));
  if(reponse.statusCode == 200 || reponse.statusCode == 304){
    _courses =convert.jsonDecode(reponse.body);
    setState(() {
      loading = !loading;
    });
  } else {
    throw Exception('failed to load courses');
  }

}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: loading ?  waitingScreen() : coursesList()

    );
  }

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('Loading data ....'),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          CircularProgressIndicator()
        ],
      ),
    );
  }

Widget coursesList() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text('Data ok ....'),
        Padding(padding: EdgeInsets.only(bottom: 25)),
      ],
    ),
  );
}

}
