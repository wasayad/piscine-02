

import 'package:flutter/material.dart';
import './component/bottomBar.dart';
import './component/appBar.dart';
import './component/view/currently.dart';
import './component/view/today.dart';
import './component/view/weekly.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  String localisation = "";

  void onLocalisationChange(String value) {
    setState(() {
      localisation = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,

        child: Scaffold(
          appBar: AppBarComponent(searchText: localisation, onChanged: onLocalisationChange),
            body: TabBarView(
              children: <Widget>[
                Currently(localisation: localisation),
                Today(localisation: localisation),
                Weekly(localisation: localisation),
              ],
            ),
          bottomNavigationBar: const BottomBar(),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
