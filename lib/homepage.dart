import 'package:designing/headphone.dart';
import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/phone.dart';
import 'package:designing/tablet.dart';

import 'package:designing/watch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String displayName = '';

  @override
  void initState() {
    super.initState();
    _loadDisplayName();
  }

  void _loadDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? '';

    setState(() {
      displayName = name;
    });
  }

  void watch(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Watch()));
  }

  void phone(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Phone()));
  }

  void television(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Keyboard()));
  }

  void laptop(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Laptop()));
  }

  void tab(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Tabb()));
  }

  void headphone(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => HeadPhone()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 890,
          decoration: const BoxDecoration(color: Colors.orangeAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Hi\n$displayName",
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 50),
                          child: GestureDetector(
                            onTap: () {
                              phone(context);
                            },
                            child: const CustomHomege(
                                text: "Phone", symbol: Icons.smartphone),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 70),
                          child: GestureDetector(
                              child: GestureDetector(
                                  onTap: () {
                                    watch(context);
                                  },
                                  child: const CustomHomege(
                                      text: "Watch", symbol: Icons.watch)))),
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 70),
                          child: GestureDetector(
                            onTap: () {
                              tab(context);
                            },
                            child: const CustomHomege(
                                text: "Tablet", symbol: Icons.tablet),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 50),
                          child: GestureDetector(
                            onTap: () {
                              laptop(context);
                            },
                            child: const CustomHomege(
                                text: "Laptop", symbol: Icons.computer),
                          )),
                      GestureDetector(
                        onTap: () {
                          headphone(context);
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(left: 15, top: 70),
                            child: CustomHomege(
                                text: "EarPhone", symbol: Icons.headphones)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 70),
                          child: GestureDetector(
                              onTap: () {
                                television(context);
                              },
                              child: const CustomHomege(
                                  text: "TV", symbol: Icons.tv))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHomege extends StatefulWidget {
  final String text;

  final IconData symbol;
  const CustomHomege({
    super.key,
    required this.text,
    required this.symbol,
  });

  @override
  State<CustomHomege> createState() => _CustomHomegeState();
}

class _CustomHomegeState extends State<CustomHomege> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 180,
        width: 180,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    widget.text,
                    style:
                        const TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      widget.symbol,
                      size: 40,
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
