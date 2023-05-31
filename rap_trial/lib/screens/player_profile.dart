import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:rap_trial/screens/login_page.dart';

class PlayerProfile extends StatefulWidget {
  const PlayerProfile({super.key});

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => MyLoginPage()));
          },
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(color: Colors.black54),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/chetri.png"),
                    radius: 50,
                  ),
                  const SizedBox(height: 20),
                  const Text("Sunil Chethri",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white)),
                  const SizedBox(height: 10),
                  const Text(
                    "sunilchetri@gmail.com",
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("  Connect  "),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(100, 255, 100, 100))),
                  // const SizedBox(height: 20),
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   Column(children: const [Text("4.8",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)), Text("Rating",style: TextStyle(color: Colors.white),)]),
                  //
                  //   Column(children: const [Text("35",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)), Text("Following",style: TextStyle(color: Colors.white),)]),
                  //   const SizedBox(width: 10),
                  //   Column(children: const [Text("50",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)), Text("Followers",style: TextStyle(color: Colors.white),)]),
                  // ]),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "About",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                            "Sunil Chhetri is a professional footballer from India who was born on August 3, 1984, in Secunderabad, Andhra Pradesh. He currently serves as the captain of the Indian national football team and plays as a striker for Bengaluru FC in the Indian Super League (ISL).",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Shorts"),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(100, 255, 100, 100)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
