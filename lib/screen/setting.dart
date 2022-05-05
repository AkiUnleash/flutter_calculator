import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final void Function(Color colorButton, Color colorBackGround1,
      Color colorBackGround2, Color colorTop) onTap;

  SettingScreen({Key? key, required this.onTap}) : super(key: key);

  final items = [
    {
      'title': 'Midnight Black',
      'colorButton': Colors.black12,
      'colorBackGround1': const Color(0xFF616161).withOpacity(0.8),
      'colorBackGround2': const Color(0xFF212121),
      'colorTop': const Color(0xFF1A1A1A),
    },
    {
      'title': 'Fire Red',
      'colorButton': const Color(0x00c51162),
      'colorBackGround1': const Color(0xFFC62828).withOpacity(0.8),
      'colorBackGround2': const Color(0xFF880E4F).withOpacity(1),
      'colorTop': const Color(0xFF880E4F),
    },
    {
      'title': 'Avenue green',
      'colorButton': const Color(0x00263238),
      'colorBackGround1': const Color(0xFF00695C).withOpacity(0.8),
      'colorBackGround2': const Color(0xFF37474F).withOpacity(1),
      'colorTop': const Color(0xFF263238),
    },
    {
      'title': 'Ocean Blue',
      'colorButton': const Color(0x00263238),
      'colorBackGround1': const Color(0xFF3949AB).withOpacity(0.8),
      'colorBackGround2': const Color(0xFF1A237E).withOpacity(1),
      'colorTop': const Color(0xFF1A237E),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
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
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          items[index]['title'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {
                              onTap(
                                items[index]['colorButton'] as Color,
                                items[index]['colorBackGround1'] as Color,
                                items[index]['colorBackGround2'] as Color,
                                items[index]['colorTop'] as Color,
                              ),
                              Navigator.of(context).pop()
                            });
                  }),
            )));
  }
}
