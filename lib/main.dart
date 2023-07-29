import 'package:flutter/material.dart';
import 'package:pos_petshop/Loading.dart';
import 'package:pos_petshop/repository.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<News> listnews = [];
  Repository repository = Repository();

  Future<void> getData() async {
    try {
      List<News> news = await repository.getData();
      setState(() {
        listnews = news;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Petshop"),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Text(listnews[index].title),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listnews.length,
        ),
      ),
    );
  }
}
