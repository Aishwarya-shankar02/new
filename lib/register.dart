import 'package:designing/login.dart';
import 'package:designing/registeration.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  void onPressed(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  void sucessful(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Registeration()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 330,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.deepOrangeAccent, Colors.orangeAccent])),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.person),
                                hintText: "Fullname"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.email),
                                hintText: "Email"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.phone),
                                hintText: "Phone Number"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.key),
                                hintText: "Password"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.deepOrangeAccent, Colors.orangeAccent])),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, elevation: 0),
                onPressed: () {
                  sucessful(context);
                },
                child: const Text(
                  "Register",
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Row(
                children: [
                  const Text(
                    "Don't have a account?",
                    style: TextStyle(color: Colors.black38),
                  ),
                  TextButton(
                      onPressed: () {
                        onPressed(context);
                      },
                      child: const Text("Login",
                          style: TextStyle(color: Colors.deepOrangeAccent)))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
