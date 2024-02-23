import 'package:appstest/dashborad.dart';
import 'package:appstest/main.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'package:iconsax/iconsax.dart';

class ButtonNavigation extends StatefulWidget {
  ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          //animationDuration: const Duration(milliseconds: 1000),
          backgroundColor: colorApp.colorPrimary,

          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Iconsax.home_1,color: colorApp.colorBackground),
              label: "Home",
              selectedIcon: Icon(Iconsax.home1,color: colorApp.colorBackground),
            ),
            NavigationDestination(
              icon: Icon(Icons.explore,color: colorApp.colorBackground),
              label: 'Explore',
              selectedIcon: Icon(Iconsax.activity5,color: colorApp.colorBackground),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.save_2,color: colorApp.colorBackground),
              label: 'Likes',
              selectedIcon: Icon(Iconsax.save_21,color: colorApp.colorBackground),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.profile_circle,color: colorApp.colorBackground),
              label: 'Profil',
              selectedIcon: Icon(Iconsax.profile_circle5,color: colorApp.colorBackground),
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: _getPage(currentPageIndex) ,
      ),
    );
  }
}

Widget _getPage(int index) {
  switch (index) {
    case 0:
      return dashboard()  ;

    case 1:
      return
        Container(
            alignment: Alignment.center,
            color: Colors.black,

            child: Text('Espaces Page',
                style: TextStyle(color: Colors.white)));
    case 2:
      return
        Container(
            alignment: Alignment.center,
            color: Colors.black,

            child: Text('Saves Page',
                style: TextStyle(color: Colors.white)));
    case 3:
      return
        Container(
            alignment: Alignment.center,
            color: Colors.black,

            child: Text('Profil Page',
                style: TextStyle(color: Colors.white)));
    default:
      return Container();
  }
}
