import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // 应用程序的标题，显示在任务管理窗口中。
      title: "my App",
      // 应用程序的主题，用于定义颜色，字体和阴影等。接受一个 ThemeData 对象
      theme: ThemeData(primarySwatch: Colors.blue),
      // 应用的首页
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('首页'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 20.0),
          ),
        )
      )
  ));
}
