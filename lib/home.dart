import 'package:appstest/dashborad.dart';
import 'package:appstest/main.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'package:iconsax/iconsax.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        bottom: false,
        top: true,
        child: Scaffold(
          extendBody: true,
          body: _getPage(_currentIndex),
            bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.red,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      backgroundColor: colorApp.colorPrimary,
                      icon: Icon(Iconsax.home_1,color: colorApp.colorBackground),
                      label: "Home",
                      activeIcon: Icon(Iconsax.home5,color: colorApp.colorBackground),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: colorApp.colorPrimary,
                      icon: Icon(Iconsax.activity,color: colorApp.colorBackground),
                      label: 'Travel',
                      activeIcon: Icon(Iconsax.activity5,color: colorApp.colorBackground),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: colorApp.colorPrimary,
                      icon: Icon(Iconsax.save_2,color: colorApp.colorBackground),
                      label: 'Likes',
                      activeIcon: Icon(Iconsax.save_21,color: colorApp.colorBackground),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: colorApp.colorPrimary,
                      icon: Icon(Iconsax.profile_circle,color: colorApp.colorBackground),
                      label: 'Profil',
                      activeIcon: Icon(Iconsax.profile_circle5,color: colorApp.colorBackground),
                    ),
                  ],
                  selectedItemColor: colorApp.colorBackground,
                  currentIndex: _currentIndex,
                  onTap: (int index){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  selectedLabelStyle: TextStyle(fontFamily: 'Poppins-Regular',fontSize: 12,color: colorApp.colorGray),
                ),
              ),

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
            color: Colors.red,

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