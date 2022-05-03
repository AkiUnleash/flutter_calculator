import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black87,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color.fromARGB(255, 106, 106, 106).withOpacity(0.8),
                  const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '0',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      children: const [
                        OriginalButton(text: "C", color: Colors.orange),
                        OriginalButton(text: "AC", color: Colors.red),
                        OriginalButton(text: "<-", color: Colors.black12),
                        OriginalButton(text: "%", color: Colors.black12),
                        OriginalButton(text: "7", color: Colors.black12),
                        OriginalButton(text: "8", color: Colors.black12),
                        OriginalButton(text: "9", color: Colors.black12),
                        OriginalButton(text: "÷", color: Colors.black12),
                        OriginalButton(text: "4", color: Colors.black12),
                        OriginalButton(text: "5", color: Colors.black12),
                        OriginalButton(text: "6", color: Colors.black12),
                        OriginalButton(text: "-", color: Colors.black12),
                        OriginalButton(text: "1", color: Colors.black12),
                        OriginalButton(text: "2", color: Colors.black12),
                        OriginalButton(text: "3", color: Colors.black12),
                        OriginalButton(text: "×", color: Colors.black12),
                        OriginalButton(text: "0", color: Colors.black12),
                        OriginalButton(text: ".", color: Colors.black12),
                        OriginalButton(text: "=", color: Colors.black12),
                        OriginalButton(text: "+", color: Colors.black12),
                      ])
                ],
              ),
            )));
  }
}

class OriginalButton extends StatelessWidget {
  final String text;
  final Color color;

  const OriginalButton({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: color, //ボタンの背景色
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
