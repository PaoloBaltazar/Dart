import 'package:flutter/material.dart';
import 'dart:math';

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => guessingGame();
}

class guessingGame extends State<myApp> {
  final myController = TextEditingController();

  int magicNumber = 15;
  String infoText = " ";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Guessing Game Program',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
            ),
            body: Material(
                color: Colors.grey,
                child: Center(
                  child: Column(children: <Widget>[
                    Container(
                        height: 90.0,
                        width: 500.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Result: $infoText",
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                    Container(
                        height: 90.0,
                        width: 500.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: myController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Guess',
                            ),
                          ),
                        )),
                    TextButton(
                      onPressed: () {
                        _validateInput(myController.text);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor:
                            Colors.deepPurpleAccent, // Background Color
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: const Text('Submit Guess'),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.all(15), //apply padding to all four sides
                      child: Text("By Gabriel Paolo I. Baltazar"),
                    ),
                  ]),
                ))));
  }

  _validateInput(String input) {
    if (int.parse(myController.text) > magicNumber) {
      setState(() {
        infoText = "Lower!";
      });
    } else if (int.parse(myController.text) < magicNumber) {
      setState(() {
        infoText = "Higher!";
      });
    } else if (int.parse(myController.text) == magicNumber) {
      setState(() {
        infoText = "You Guessed the Number!";
      });
    }
  }
}
