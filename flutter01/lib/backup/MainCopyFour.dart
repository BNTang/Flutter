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
          body: Stack(
            children: <Widget>[
              Positioned(
                left: 50,
                top: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                right: 50,
                bottom: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
              Positioned(
                left: 150,
                top: 150,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          )
      )
    )
 );
}
