import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rap_trial/screens/player_profile.dart';
import 'package:rap_trial/screens/profile_setup.dart';

class PlayerPosition extends StatefulWidget {
  const PlayerPosition({super.key});

  @override
  State<PlayerPosition> createState() => _PlayerPositionState();
}

class _PlayerPositionState extends State<PlayerPosition> {
  final _db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POSITIONS',
          style: TextStyle(
            color: Color(0xFF43AD99),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 42, 42),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Stack(
          children: [
            // Back button
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileSetup()));
                    },
                    child: const Text(
                      "BACK",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ),
                  )),
            ),

            // Next button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerProfile()));
                    },
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ),
                  )),
            ),
            Positioned(
              left: 140,
              top: 30,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Centre Forward"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Centre Forward',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 20,
              top: 130,
              child: ElevatedButton(
                onPressed: () {

                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Left Wing"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Left Wing',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 280,
              top: 130,
              child: ElevatedButton(
                onPressed: () {

                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Right Wing"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Right Wing',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 20,
              top: 300,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Left Mid"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Left Mid',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 150,
              top: 300,
              child: ElevatedButton(
                onPressed: () {

                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Centre Mid"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Centre Mid',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 280,
              top: 300,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Right Mid"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Right Mid',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 20,
              top: 470,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Left Back"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Left Back',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 150,
              top: 470,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Centre Back"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Centre Back',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 280,
              top: 470,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Right Back"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text('Right Back',
                    style: TextStyle(color: Color.fromARGB(255, 67, 173, 153))),
              ),
            ),
            Positioned(
              left: 150,
              top: 600,
              child: ElevatedButton(
                onPressed: () {
                  _db
                      .collection('Players')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "position": "Goal Keeper"
                   
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  onPrimary: const Color(0xFF43AD99),
                  minimumSize: const Size(100, 60),
                ),
                child: const Text(
                  'Goal Keeper',
                  style: TextStyle(color: Color.fromARGB(255, 67, 173, 153)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
