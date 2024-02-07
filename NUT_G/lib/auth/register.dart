import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nut_g/auth/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../screens/registration_controller.dart';
import '../utils/showsnack.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _authcontroller = AuthController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String firstName;

  late String userType;

  late String lastName;

  late String email;

  late String phoneNumber;

  late String password;

  Uint8List? _image;

  final List<String> _usertype = ['Admin', 'customer'];

  String? _customerStatus;
  selectGalleryImage() async {
    Uint8List im = await _authcontroller.pickProfileImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  selectCameraImage() async {
    Uint8List im = await _authcontroller.pickProfileImage(ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  _signUpUser() async {
    setState(() {
      //start loading after function call
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      await _authcontroller
          .signUpUsers(firstName, lastName, email, phoneNumber, password,
              _image, userType)
          .whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
          //stop loading after creating account
          _isLoading = false;
        });
      });
      return showSnack(context, 'Account created Successfully');
    } else {
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'please fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register as customer',
                  style: TextStyle(fontSize: 20),
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.lightGreen.shade900,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.lightGreen.shade900,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                          ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child: IconButton(
                        onPressed: () {
                          selectGalleryImage();
                        },
                        icon: Icon(
                          CupertinoIcons.photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'mandatory first name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(labelText: 'First name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'mandatory Last name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      lastName = value;
                    },
                    decoration: InputDecoration(labelText: 'Last name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'mandatory email';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'mandatory phone number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(labelText: 'Phone number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'mandatory password';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: DropdownButtonFormField(
                      iconEnabledColor: Colors.lightGreen.shade300,
                      focusColor: Colors.lightGreen.shade300,
                      dropdownColor: Colors.lightGreen.shade500,
                      hint: Text('select'),
                      items: _usertype.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        _customerStatus = value;
                        value = userType;
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _signUpUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFedccb3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                              ),
                            ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already registered?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
