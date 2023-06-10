import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rap_trial/models/user_model.dart';
import 'package:rap_trial/screens/player_position.dart';
import 'package:rap_trial/services/storage_services.dart';
import 'package:rap_trial/utils/utils.dart';
import 'package:rap_trial/services/auth_services.dart';
import '../repository/user_repository.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  String? gender;
  int  _groupvalue = 0;
  Uint8List? _image;
  Uint8List? file;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _mobilenoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

//controller initialize

  final _fullnameController = TextEditingController();
  final _dobController = TextEditingController();

  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();

  //final userRepo = Get.put(UserRepository);

  @override
  void dispose() {
    _mobilenoController.dispose();
    _fullnameController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();

    super.dispose();
  }

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  void saveprofile() async {
    String resp = await StorageMethods().addImage(file: _image!);
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(123, 62, 168, 149)),
        )));
  }

  Future<void> registeruser(UserModel user) async {
    await UserRepository().registeruser(user);
    Get.to(() => const PlayerPosition());
  }

  /*Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }*/

//void phoneAuth(String mobileno)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                  child: const Text(
                    'General Info',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: Color.fromARGB(255, 62, 168, 149)),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _image != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                      backgroundImage: const NetworkImage(
                          'https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 62, 168, 149),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Handle edit button press
                              selectImage();
                            },
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _fullnameController,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(123, 62, 168, 149),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment(-0.75, -1),
                child: Text(
                  'Gender:',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(123, 62, 168, 149)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        horizontalTitleGap: 0,
                        title: const Text(
                          'Male',
                          style: TextStyle(
                              color: Color.fromARGB(123, 62, 168, 149),
                              fontSize: 20),
                        ),
                        leading: Radio(
                          activeColor: const Color.fromARGB(123, 62, 168, 149),
                          value: 0,
                          groupValue: _groupvalue,
                          onChanged: (handleRadio) {
                            setState(() {
                              _groupvalue = 0;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 4),
                        horizontalTitleGap: 0,
                        title: const Text(
                          'Female',
                          style: TextStyle(
                              color: Color.fromARGB(123, 62, 168, 149),
                              fontSize: 20),
                        ),
                        leading: Radio(
                          activeColor: const Color.fromARGB(123, 62, 168, 149),
                          value: 1,
                          groupValue: _groupvalue,
                          onChanged: (handleRadio) {
                            setState(() {
                              _groupvalue = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListTile(
                        horizontalTitleGap: 0,
                        title: const Text(
                          'Other',
                          style: TextStyle(
                              color: Color.fromARGB(123, 62, 168, 149),
                              fontSize: 20),
                        ),
                        leading: Radio(
                          activeColor: const Color.fromARGB(123, 62, 168, 149),
                          value: 2,
                          groupValue: _groupvalue,
                          onChanged: (handleRadio) {
                            setState(() {
                              _groupvalue = 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _dobController,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "DOB",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(123, 62, 168, 149)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _mobilenoController,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(123, 62, 168, 149)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _countryController,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "Country",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(123, 62, 168, 149)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _stateController,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "State",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(123, 62, 168, 149)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: 350,
                child: TextField(
                  controller: _pincodeController,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      hintText: "Pin Code",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(123, 62, 168, 149)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  final user = UserModel(
                    fullname: _fullnameController.text.trim(),
                    dob: _dobController.text.trim(),
                    mobileno: _mobilenoController.text.trim(),
                    country: _countryController.text.trim(),
                    state: _stateController.text.trim(),
                    pincode: _pincodeController.text.trim(),
                  );

                  if (_fullnameController.text.trim().isEmpty) {
                    showSnackBar("Please enter your full name");
                  } else if (_dobController.text.trim().isEmpty) {
                    showSnackBar("Please enter your date of birth");
                  } else if (_mobilenoController.text.trim().isEmpty) {
                    showSnackBar("Please enter your mobile number");
                  } else if (_countryController.text.trim().isEmpty) {
                    showSnackBar("Please enter your nationality");
                  } else if (_stateController.text.trim().isEmpty) {
                    showSnackBar("Please enter the state your living in");
                  } else if (_pincodeController.text.trim().isEmpty) {
                    showSnackBar("Please enter your pincode");
                  } else {
                     await registeruser(user);

                    if (_groupvalue == 0) {
                      _db
                          .collection('Players')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({"gender": "Male"});
                    } else if (_groupvalue == 1) {
                      _db
                          .collection('Players')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({"gender": "Female"});
                    } else{
                       _db
                          .collection('Players')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({"gender": "Other"});
                    }
                   

                    saveprofile();
                    //StorageMethods();
                    Get.to(() => const PlayerPosition());
                  }
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
