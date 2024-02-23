import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';

import 'home.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool isChecked = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.colorPrimary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 23),
                child: Image(image: AssetImage('assets/images/Vector.png'))),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: colorApp.colorBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 25),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Poppins-SemiBold',
                                  fontSize: 26,
                                ),
                              ),
                            ),
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
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 25, bottom: 0),
                          child: SizedBox(
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 12,
                                  color: colorApp.colorPrimary),
                              cursorColor: colorApp.colorPrimary,
                              decoration: InputDecoration(
                                filled: false,
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  color: colorApp.colorGray,
                                ),
                                labelText: 'Username',
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
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 25, bottom: 0),
                          child: SizedBox(
                            height: 60,
                            child: TextField(
                              cursorColor: colorApp.colorPrimary,
                              obscureText: true,
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 12,
                                  color: colorApp.colorPrimary),
                              decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Checkbox(
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
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
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular', fontSize: 14),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 28),
                                child: TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: colorApp.colorPrimary,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: SizedBox(
                            width: 358,
                            height: 56,
                            child: FilledButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                                //navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const Home()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          colorApp.colorPrimary),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold', fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            "Or",
                            style: TextStyle(
                                fontFamily: 'Poppins-SemiBold', fontSize: 16),
                          ),
                        ),
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
                                  icon: Icon(Icons.apple_outlined),
                                  label: Text(
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
                                  icon: Icon(Icons.facebook),
                                  label: Text(
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
                        ),
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
