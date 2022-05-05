import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calculator/components/button.dart';
import 'package:flutter_calculator/screen/setting.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatter = NumberFormat("#,###.#########");

  // Color
  Color _colorButton = Colors.black12;
  Color _colorBackGround1 = const Color(0xFF616161).withOpacity(0.8);
  Color _colorBackGround2 = const Color(0xFF212121);
  Color _colorTop = const Color(0xFF1A1A1A);

  void _colorChange(Color colorButton, Color colorBackGround1,
      Color colorBackGround2, Color colorTop) {
    setState(() {
      _colorButton = colorButton;
      _colorBackGround1 = colorBackGround1;
      _colorBackGround2 = colorBackGround2;
      _colorTop = colorTop;
    });
  }

  // Calculation
  double _totalValue = 0;
  double _displayNumber = 0;
  double _backNumber = 0;
  int _operator = 0;
  bool _isOperator = false;
  int _pointInt = 0;

  // Processing when a numeric button is pressed.
  void _numberButton(double number) {
    setState(() {
      if (_isOperator == false) {
        if (_pointInt == 0) {
          _displayNumber = (_displayNumber * 10) + number;
          _backNumber = _displayNumber;
        } else {
          _displayNumber = _displayNumber + (number / pow(10, _pointInt));
          _backNumber = _displayNumber;
          _pointInt++;
        }
      } else {
        _totalValue = _displayNumber;
        _displayNumber = number;
        _backNumber = _displayNumber;
        _isOperator = false;
      }
    });
  }

  // Processing when a Arithmetic operator button is pressed.
  // + = 1 , - = 2 , * = 3 , / = 4
  void _operatorButton(int operator) {
    _operator = operator;
    _isOperator = true;
  }

  // Processing when a Arithmetic operator button is pressed.
  void _pointButton() {
    setState(() {
      _pointInt = 1;
    });
  }

  // Processing when a Back Clear button is pressed.
  void _backButton() {
    setState(() {
      _displayNumber = (_displayNumber / 10).floorToDouble();
      _backNumber = _displayNumber;
    });
  }

  // Processing when a equal button is pressed.
  void _resultButton() {
    switch (_operator) {
      case 1:
        _totalValue += _backNumber;
        break;
      case 2:
        _totalValue -= _backNumber;
        break;
      case 3:
        _totalValue *= _backNumber;
        break;
      case 4:
        _totalValue = _totalValue / _backNumber;
        break;
    }
    setState(() {
      _displayNumber = _totalValue;
    });
  }

  // Processing when a percent button is pressed.
  void _percentButton() {
    if (_totalValue == 0) {
      setState(() {
        _displayNumber = (_displayNumber / 100);
        _backNumber = _displayNumber;
      });
    } else {
      _displayNumber = _totalValue * (_displayNumber / 100);
      _backNumber = _displayNumber;
      _resultButton();
    }
  }

  // Processing when a clear button is pressed.
  void _clearButton() {
    setState(() {
      _displayNumber = 0;
      _backNumber = 0;
      _operator = 0;
      _pointInt = 0;
    });
  }

  // Processing when a all clear button is pressed.
  void _allClearButton() {
    setState(() {
      _totalValue = 0;
      _displayNumber = 0;
      _backNumber = 0;
      _operator = 0;
      _pointInt = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: _colorTop,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingScreen(
                              onTap: _colorChange,
                            )));
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [_colorBackGround1, _colorBackGround2],
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
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          formatter.format(_displayNumber),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
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
                      children: [
                        Button(
                            text: "C",
                            color: Colors.orange,
                            onPressed: () => _clearButton()),
                        Button(
                            text: "AC",
                            color: Colors.red,
                            onPressed: () => _allClearButton()),
                        Button(
                            text: "<-",
                            color: _colorButton,
                            onPressed: () => _backButton()),
                        Button(
                            text: "%",
                            color: _colorButton,
                            onPressed: () => _percentButton()),
                        Button(
                            text: "7",
                            color: _colorButton,
                            onPressed: () => _numberButton(7)),
                        Button(
                            text: "8",
                            color: _colorButton,
                            onPressed: () => _numberButton(8)),
                        Button(
                            text: "9",
                            color: _colorButton,
                            onPressed: () => _numberButton(9)),
                        Button(
                            text: "÷",
                            color: _colorButton,
                            onPressed: () => _operatorButton(4)),
                        Button(
                            text: "4",
                            color: _colorButton,
                            onPressed: () => _numberButton(4)),
                        Button(
                            text: "5",
                            color: _colorButton,
                            onPressed: () => _numberButton(5)),
                        Button(
                            text: "6",
                            color: _colorButton,
                            onPressed: () => _numberButton(6)),
                        Button(
                            text: "-",
                            color: _colorButton,
                            onPressed: () => _operatorButton(2)),
                        Button(
                            text: "1",
                            color: _colorButton,
                            onPressed: () => _numberButton(1)),
                        Button(
                            text: "2",
                            color: _colorButton,
                            onPressed: () => _numberButton(2)),
                        Button(
                            text: "3",
                            color: _colorButton,
                            onPressed: () => _numberButton(3)),
                        Button(
                            text: "×",
                            color: _colorButton,
                            onPressed: () => _operatorButton(3)),
                        Button(
                            text: "0",
                            color: _colorButton,
                            onPressed: () => _numberButton(0)),
                        Button(
                            text: ".",
                            color: _colorButton,
                            onPressed: () => _pointButton()),
                        Button(
                            text: "=",
                            color: _colorButton,
                            onPressed: () => _resultButton()),
                        Button(
                            text: "+",
                            color: _colorButton,
                            onPressed: () => _operatorButton(1)),
                      ])
                ],
              ),
            )));
  }
}
