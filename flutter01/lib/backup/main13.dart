import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => PageB(
              key: UniqueKey(),
              data: "Hello Flutter",
            )
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Navigate to second screen'),
          onPressed: () {
            // Navigator.pushNamed(context, '/second');
            Navigator.pushNamed(context, '/second', arguments: 'Hello Flutter');
          },
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  final String data;

  const PageB({required Key key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
