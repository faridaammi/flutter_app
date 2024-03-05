import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class detailsProduct extends StatefulWidget {

  final int id;

  const detailsProduct({required this.id});

  @override
  State<detailsProduct> createState() => _detailsProductState();
}

class _detailsProductState extends State<detailsProduct> {

  Map<String, dynamic> product = {};
  Future getProducts(int id) async{
    var url = Uri.http("127.0.0.1:8000","api/produits/$id");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        product = convert.jsonDecode(response.body);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Products"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Image(image: NetworkImage(product['lien_image'].toString())),
             Text(product['nom'],style: const TextStyle(
                fontFamily: 'Poppins-SemiBold',fontSize: 28),),
            const SizedBox(height: 16,),
             Text(product['description'],style: const TextStyle(
                fontFamily: 'Poppins-Regular',fontSize: 12),),
            const SizedBox(height: 16,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Colors :',style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',fontSize: 15),),
                SizedBox(width: 190,),
                Text('Quantity :',style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',fontSize: 15),),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              children: [
                CircleAvatar(backgroundColor: Colors.red,),
                SizedBox(width: 6,),
                CircleAvatar(backgroundColor: Colors.black,),
                SizedBox(width: 6,),
                CircleAvatar(backgroundColor: Colors.grey,),
              ],
            ),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 5.0,
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
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(product["prix"].toString()+" MAD",style: const TextStyle(
                      fontFamily: 'Poppins-SemiBold',fontSize: 20),),
                  ElevatedButton.icon(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.redAccent),
                    ),
                    icon: const Icon(Iconsax.shopping_cart,color: Colors.white),
                    label: const Text('Add to cart',style: TextStyle(
                      fontFamily: 'Poppins-Regular',fontSize: 18,color: Colors.white),),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
