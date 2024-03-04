import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:appstest/style/colors.dart';


class dashboard extends StatefulWidget {
  String name ;
  dashboard ({super.key,required this.name});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final List<ListItem> items = [
    ListItem('Popular', Icons.explore_outlined),
    ListItem('Lake', Icons.water),
    ListItem('Beach', Icons.beach_access),
    ListItem('Mountain', Icons.filter_hdr_rounded),
    ListItem('Gardens', Icons.nature),
  ];
  final List<ListPlace> itemsPlaces = [
    ListPlace('Name of place and i need test title', Image.asset('assets/images/img.png'),'4',"Lorem ipsum dolor sit amet consectetur. Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur."),
    ListPlace('Title Of Place', Image.asset('assets/images/img_1.png'),'3',"Lorem ipsum dolor sit amet consectetur. "),
    ListPlace('titre de place', Image.asset('assets/images/img_2.png'),'5',"Lorem ipsum dolor sit amet consectetur. "),
    ListPlace('titre de place', Image.asset('assets/images/img_4.png'),'5',"Lorem ipsum dolor sit amet consectetur. "),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: colorApp.colorBackground,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton.filledTonal(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.transparent),
                    ),
                    icon: const Icon(Iconsax.menu_1,color: colorApp.colorPrimary,)),
                 Row(
                  children: [

                    const Icon(Iconsax.location,color: colorApp.colorPrimary),
                    const SizedBox(width: 10),
                    Text('Welcome back ${widget.name} !',style: const TextStyle(
                      color: colorApp.colorPrimary,
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16,
                    ),),
                  ],
                ),

                //Icon(Iconsax.user,color: colorApp.colorPrimary,)
                CircleAvatar(
                  backgroundColor: colorApp.colorPrimary,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: const Image(
                      image: AssetImage('assets/images/vector_profil.png'),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  //constraints: Image.asset('assets/images/vector_profil.png'),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          width: 96,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_,index)
                            {
                              return Container(
                                margin: const EdgeInsets.all(6),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        print(itemsPlaces[index].desc);
                                      },
                                      icon: Icon(items[index].iconItem,color: colorApp.colorPrimary),
                                      label: Text(items[index].titleItem,style: const TextStyle(fontFamily: 'Poppins-Regular',fontSize: 13,color: colorApp.colorPrimary),),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                        side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: colorApp.colorPrimary,width: 1.5)),
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      ), // <-- Text
                                    ),
                                  ],
              
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        itemCount: itemsPlaces.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context,i)
                        {
                          return Container(
                            width: 181,
                            height: 201,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: colorApp.colorBackground,
                              boxShadow: const [
                                BoxShadow(
                                  color: CupertinoColors.systemGrey,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset:  Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                            ], //BoxDecoration
                            ),
                            margin: const EdgeInsets.all(6),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Image(image: itemsPlaces[i].imgPlace.image,width: 181,height: 135,alignment: Alignment.center,fit: BoxFit.fill,),
                                const SizedBox(
                                  height: 4,
                                  width: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12,right: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        itemsPlaces[i].titlePlace.length > 12 ? itemsPlaces[i].titlePlace.substring(0,12)+'...' : itemsPlaces[i].titlePlace,
                                        style: const TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 12,
                                        color: Colors.black,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                        textAlign: TextAlign.left,),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 28,right: 4),
                                        child:Icon(Iconsax.star1,color: Colors.orange,size: 16,
                                        ),
                                        //Ico(Iconsax.star),
                                      ),
                                      Text(itemsPlaces[i].review,style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontFamily: 'Poppins-SemiBold',
                                            color: Colors.black
                                      ))
                                    ],
                                  ),

                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12,right: 12,bottom: 2),
                                  child: Text(itemsPlaces[i].desc,maxLines: 2,softWrap: true,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        fontSize: 8,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      textAlign: TextAlign.left),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                    width: 96,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text("Popular Places",style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),//popular places text
                  const SizedBox(
                    height: 25,
                  ),
                  ////////////////////
                  ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),

                    itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: CupertinoColors.systemGrey,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 25.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset:  Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Stack(

                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Container(

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                    child: const Image(image: AssetImage("assets/images/img_2.png"),
                                      width: 182,
                                      height: 162,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: <Color>[
                                          Color(0x100FFFFFF),
                                          Colors.white,
                                          Colors.white
                                        ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                        tileMode: TileMode.mirror,
                                      ),
                                    ),
                                    width: 76,
                                    height: 162,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 142,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(6),
                              //color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text("Name Of Place",style: TextStyle(fontFamily: 'Poppins-Regular',fontSize: 13,color: Colors.black),),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: colorApp.colorPrimary,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: Icon(Iconsax.heart,size: 20,color: colorApp.colorBackground,))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Text("Lorem ipsum dolor sit amet consectetur. Habitasse sit laoreet proin felis mauris vel libero",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodySmall),
                                  const SizedBox(height: 5,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(Iconsax.star1,color: Colors.orangeAccent,),
                                      Text("(5.0)",
                                        style:  TextStyle(fontFamily: 'Poppins-Regular',fontSize: 10,color: Colors.black),)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(onPressed: (){},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                colorApp.colorPrimary
                                            ),
                                          ), child: const Text("Show Now",
                                            style:  TextStyle(fontFamily: 'Poppins-Regular',fontSize: 10,color: colorApp.colorBackground),),
                                        ),
                                      ),
                                      /*const SizedBox(
                                          width: 5,
                                        ),*/
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex: 2,
                                        child: OutlinedButton(onPressed: (){},
                                          style: const ButtonStyle(
                                              side: MaterialStatePropertyAll<BorderSide>(
                                                  BorderSide(color: colorApp.colorPrimary)
                                              )
                                          ), child: const Text('3.4KM',
                                            style: TextStyle(fontFamily: 'Poppins-Regular',fontSize: 10,color: colorApp.colorPrimary),),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  ),//containner popluar place
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ListItem{
  final String titleItem;
  final IconData iconItem;

  ListItem(this.titleItem,this.iconItem);
}
class ListPlace {
  final String titlePlace;
  final Image imgPlace;
  final String review;
  final String desc;

  ListPlace(this.titlePlace, this.imgPlace, this.review, this.desc);
}