import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';


import 'home.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool isChecked = false;
  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.colorPrimary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 23),
                child: const Image(image: AssetImage('assets/images/Vector.png'))),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: colorApp.colorBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 25),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Poppins-SemiBold',
                                  fontSize: 26,
                                ),
                              ),
                            ),//// Sign up
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
                            style: TextStyle(
                              fontFamily: 'Poppins-Light',
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),//// first description

                        Form(
                          key: formKey,
                            child: Column(
                          children: [
                            Padding(
                              padding:  const EdgeInsets.only(
                                  left: 25, right: 25, top: 25, bottom: 0),
                              child: Column(
                                children: [
                                  SizedBox(

                                    child: TextFormField(
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value!.isEmpty || !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontSize: 14,
                                          color: colorApp.colorPrimary),
                                      cursorColor: colorApp.colorPrimary,
                                      decoration: const InputDecoration(
                                        filled: false,
                                        prefixIcon: Icon(
                                          Icons.person_2_outlined,
                                          color: colorApp.colorGray,
                                        ),
                                        labelText: 'Email',
                                        floatingLabelStyle: TextStyle(
                                            color: colorApp.colorPrimary,
                                            fontSize: 14,
                                            fontFamily: 'Poppins-Regular'),
                                        labelStyle: TextStyle(
                                            fontFamily: 'Poppins-Regular', fontSize: 12),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(
                                              width: 2, color: colorApp.colorPrimary),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(
                                              width: 2, color: colorApp.colorPrimary),
                                        ),
                                      ),
                                    ),
                                  ),//// Email
                                  const SizedBox(height: 30,),
                                   SizedBox(
                                    child: TextFormField(
                                        validator: (value) {
                                           if (value!.isEmpty || !RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$').hasMatch(value)) {
                                           return 'Please verify your password';
                                           }
                                           return null;
                                           },
                                      controller: _passwordController,
                                      cursorColor: colorApp.colorPrimary,
                                      obscureText: true,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontSize: 12,
                                          color: colorApp.colorPrimary),
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline),
                                        labelStyle: TextStyle(
                                            fontFamily: 'Poppins-Regular', fontSize: 12),
                                        labelText: 'Password',
                                        floatingLabelStyle: TextStyle(
                                            color: colorApp.colorPrimary,
                                            fontSize: 14,
                                            fontFamily: 'Poppins-Regular'),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2, color: colorApp.colorPrimary),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(
                                              width: 2, color: colorApp.colorPrimary),
                                        ),
                                      ),
                                    ),

                                  ),
                                  /*SizedBox(
                                      child: FlutterPwValidator(
                                          controller: _passwordController,
                                          minLength: 6,
                                          uppercaseCharCount: 2,
                                          lowercaseCharCount: 2,
                                          numericCharCount: 3,
                                          specialCharCount: 1,
                                          width: 300,
                                          height: 10,
                                        onSuccess: () {
                                          print("MATCHED");
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text("Password is matched")));
                                        },
                                          onFail: (){
                                            print('error');
                                          },
                                      )
                                  )*/
                                  //// Password
                                ],
                              ),
                            ),//// email and password
                            Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                          (states) =>const BorderSide(
                                          width: 2.0, color: colorApp.colorPrimary),
                                    ),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    checkColor: colorApp.colorPrimary,
                                    fillColor: MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                  ),
                                  const Text(
                                    "Remember me",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Regular', fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28),
                                    child: TextButton(
                                      onPressed: () => {},
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Regular',
                                            color: colorApp.colorPrimary,
                                            fontSize: 14),
                                      ),
                                    ),
                                  )////Forgot Password?
                                ],
                              ),
                            ),//// Remember_me
                            Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                              child: SizedBox(
                                width: 358,
                                height: 56,
                                child: FilledButton(
                                  onPressed: () {
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                                    /*if (Form.of(context).validate()) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                                    }*/
                                    //navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const Home()));
                                    if (formKey.currentState!.validate()) {

                                      Navigator.of(context).
                                      push(MaterialPageRoute(builder: (context) => Home(email: _emailController.text, password : _passwordController.text)));
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          colorApp.colorPrimary),
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                                  child: const Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold', fontSize: 17),
                                  ),
                                ),
                              ),
                            ),////button continue
                            const Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold', fontSize: 16),
                              ),
                            ),////or
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 25, right: 25, top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 56,
                                    child: FilledButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.apple_outlined),
                                      label: const Text(
                                        "With Apple",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 12),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            colorApp.colorGray),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 56,
                                    child: OutlinedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.facebook),
                                      label: const Text(
                                        "With Facebook",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 12),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            colorApp.colorGray),
                                        iconColor: MaterialStateProperty.all<Color>(
                                            colorApp.colorPrimary),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),////buttons facebook and apple
                          ],
                        )),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* */