import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 应用程序的标题，显示在任务管理窗口中。
        title: "my App",
        // 应用程序的主题，用于定义颜色，字体和阴影等。接受一个 ThemeData 对象
        theme: ThemeData(primarySwatch: Colors.blue),
        // 应用的首页
        home: const MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('首页'),
          centerTitle: true,
        ),
        body: const MyStateful());
  }
}

class MyHomeTwo extends StatelessWidget {
  final isCheck = true;

  const MyHomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Checkbox(
              value: isCheck,
              onChanged: (val) {
                print(val);
              })
        ],
      ),
    );
  }
}

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyStatefulState();
  }
}

class MyStatefulState extends State {
  var isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Checkbox(
              value: isCheck,
              onChanged: (val) {
                print(val);
                // this.isCheck = val as bool;
                setState(() {
                  isCheck = val as bool;
                });
                print(isCheck);
              })
        ],
      ),
    );
  }
}
