// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimerApp(),
    );
  }
}

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _scounter = 0;
  int _mcounter = 0;
  Timer? _timer;
  void startTimer() {
    int totalScounter = _mcounter * 60 + _scounter;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalScounter > 0) {
        setState(() {
          totalScounter -= 1;
          _mcounter = totalScounter ~/ 60;
          _scounter = totalScounter % 60;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _incrementCounter1() {
    setState(() {
      _mcounter += 5;
    });
  }

  void _incrementCounter5() {
    setState(() {
      _mcounter += 10;
    });
  }

  void _decrementCounter10() {
    setState(() {
      _mcounter -= 10;
      if (_mcounter <= 0) {
        _mcounter = 0;
      }
    });
  }

  void _decrementCounter1() {
    setState(() {
      _mcounter -= 5;
      if (_mcounter <= 0) {
        _mcounter = 0;
      }
    });
  }

  void _reset() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
    setState(() {
      _mcounter = 0;
      _scounter = 0;
    });
  }

  void digits() {
    if (_mcounter < 10 && _scounter < 10) {
      Text('0$_mcounter:0$_scounter',
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
    } else {
      Text('$_mcounter:$_scounter',
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Pomodoro'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ' ${_mcounter.toString().padLeft(2, '0')} : ${_scounter.toString().padRight(2, '0 ')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _reset,
                    child: const Text('Reset',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 16, 24, 59),
                        )),
                  ),
                ),
                SizedBox(
                  width: 100, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: const Text('Start',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 16, 24, 59),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Add some spacing between the rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80, // Adjust the width as needed
                  height: 35, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: _decrementCounter10,
                    child: const Text('-10',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 24, 59),
                        )),
                  ),
                ),
                SizedBox(
                  width: 80, // Adjust the width as needed
                  height: 35, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: _incrementCounter5,
                    child: const Text('+10',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 24, 59),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Add some spacing between the rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 65, // Adjust the width as needed
                  height: 30, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: _decrementCounter1,
                    child: const Text('-5',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                  ),
                ),
                SizedBox(
                  width: 65, // Adjust the width as needed
                  height: 30, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: _incrementCounter1,
                    child: const Text('+5',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
