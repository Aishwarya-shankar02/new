import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profileuser extends StatefulWidget {
  const Profileuser({Key? key}) : super(key: key);

  @override
  State<Profileuser> createState() => _ProfileuserState();
}

class _ProfileuserState extends State<Profileuser> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.deepOrangeAccent, Colors.orangeAccent])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      "$displayName",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(right: 30),
                          //   child: Text(
                          //     "Login",
                          //     style: TextStyle(color: Colors.white, fontSize: 30),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                child: ProfileCard(icon: Icons.account_box, text: "Profile")),
            ProfileCard(icon: Icons.settings, text: "Settings"),
            ProfileCard(icon: Icons.info, text: "About"),
            ProfileCard(icon: Icons.logout_outlined, text: "Logout"),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final IconData icon;
  final String text;
  ProfileCard({required this.icon, required this.text});

  @override
  State<ProfileCard> createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Card(
                shadowColor: Colors.deepOrange,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(widget.icon)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
