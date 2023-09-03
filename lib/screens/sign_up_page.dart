import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/model/user_model.dart';
import 'package:flutter_exercise/screens/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _selectedSex = 'Male';

  Future<void> signUpUser() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _numberController.text,
        );

        if (userCredential.user == null) {
          print('User authentication failed.');
          return;
        }

        UserModel user = UserModel(
          name: _nameController.text,
          email: _emailController.text,
          number: _numberController.text,
          age: int.parse(_ageController.text),
          height: double.parse(_heightController.text),
          weight: double.parse(_weightController.text),
          sex: _selectedSex,
        );

        DocumentReference userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid);

        await userDoc.set(user.toMap());

        print('User signed up successfully');
      } catch (error) {
        print('Error signing up: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: primaryColor,
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _ageController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: primaryColor,
                      hintText: 'Age',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _heightController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: primaryColor,
                      hintText: 'Height',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _weightController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your weight';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusColor: primaryColor,
                      hintText: 'Weight',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                          // Use the appropriate focused border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedSex,
                    items: ['Male', 'Female', 'Other'].map((sex) {
                      return DropdownMenuItem<String>(
                        value: sex,
                        child: Text(sex),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value!;
                      });
                    },
                    validator: (value) {
                      if (_selectedSex.isEmpty) return 'You must select a sex.';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Sex',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                        
                         
                            UserModel user = UserModel(
                              name: _nameController.text,
                              email: _emailController.text,
                              number: _numberController.text,
                              age: int.parse(_ageController.text),
                              height: double.parse(_heightController.text),
                              weight: double.parse(_weightController.text),
                              sex: _selectedSex,
                            );

                            await signUpUser();
                              print("Name to be passed: ${_nameController.text}");

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(name: _nameController.text,),
                              ),
                              (route) => false,
                            );
                          _emailController.clear();
                          _nameController.clear();
                          _numberController.clear();
                          _ageController.clear();
                          _heightController.clear();
                          _weightController.clear();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
