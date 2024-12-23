import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
 String _number1 = '';
  String _number2 = '';
  String _result = 'Result = 0';

  void _onOperatorPressed(String operator) {
    if (_number1.isNotEmpty && _number2.isNotEmpty) {
      double num1 = double.parse(_number1);
      double num2 = double.parse(_number2);
      double result;

      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = double.nan; 
          }
          break;
        default:
          result = 0.0;
      }

      setState(() {
        _result = 'Result = ${result.toStringAsFixed(2)}';
      });
    }
  }

  void _onClearPressed() {
    setState(() {
      _number1 = '';
      _number2 = '';
      _result = 'Result = 0';
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // Input Section
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Input for Number 1
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Num1',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _number1 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    // Input for Number 2
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Num2',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _number2 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Result Section
            Container(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 20,
                    color: Colors.green,
                  ),
                  Text(_result, style: const TextStyle(fontSize: 20)),
                  Container(
                    width: 50,
                    height: 20,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
//اه
            // Buttons Section
            Expanded(
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _onOperatorPressed('+'),
                      child: const Text('+', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(55, 55),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _onOperatorPressed('-'),
                      child: const Text('-', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(55, 55),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _onOperatorPressed('*'),
                      child: const Text('*', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(55, 55),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _onOperatorPressed('/'),
                      child: const Text('/', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(55, 55),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
