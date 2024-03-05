import 'dart:convert';

import 'package:appstest/Product.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class addProduct extends StatefulWidget {
  const addProduct({super.key});

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {

  final TextEditingController _nom = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _link = TextEditingController();
  final TextEditingController _tva = TextEditingController();

  Future addProducts() async{
    List<dynamic> lstProduct ;
    var url = Uri.http("127.0.0.1:8000","api/produits");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body:
        jsonEncode(
            {
              "nom":_nom.text,
              "description":_description.text,
              "lien_image":_link.text,
              "prix":_price.text,
              "tva":_tva.text
            }
        )
    );
    if (response.statusCode == 200) {
      //print("Product added successfully!");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Product added successfully!"),
      ));
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> product()));
    }
    else {
      //print("Failed to added product!!");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to added product!"),
      ));

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: _nom,
              style: const TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: colorApp.colorPrimary),
              cursorColor: colorApp.colorPrimary,
              decoration: const InputDecoration(
                filled: false,
                prefixIcon: Icon(
                  Icons.shopping_bag_outlined,
                  color: colorApp.colorGray,
                ),
                labelText: 'Product name',
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
            const SizedBox(height: 20,),
            TextFormField(
              controller: _price,
              style: const TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: colorApp.colorPrimary),
              cursorColor: colorApp.colorPrimary,
              decoration: const InputDecoration(
                filled: false,
                prefixIcon: Icon(
                  Icons.price_check,
                  color: colorApp.colorGray,
                ),
                labelText: 'Product Price',
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
            const SizedBox(height: 20,),
            TextFormField(
              controller: _link,
              style: const TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: colorApp.colorPrimary),
              cursorColor: colorApp.colorPrimary,
              decoration: const InputDecoration(
                filled: false,
                prefixIcon: Icon(
                  Icons.photo_outlined,
                  color: colorApp.colorGray,
                ),
                labelText: 'Product Image',
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
            const SizedBox(height: 20,),
            TextFormField(
              controller: _description,
              style: const TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: colorApp.colorPrimary),
              cursorColor: colorApp.colorPrimary,
              decoration: const InputDecoration(
                filled: false,
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: colorApp.colorGray,
                ),
                labelText: 'Product description',
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
            const SizedBox(height: 20,),
            TextFormField(
              controller: _tva,
              style: const TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: colorApp.colorPrimary),
              cursorColor: colorApp.colorPrimary,
              decoration: const InputDecoration(
                filled: false,
                prefixIcon: Icon(
                  Icons.percent_rounded,
                  color: colorApp.colorGray,
                ),
                labelText: 'Product Tva',
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
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton.icon(
                    onPressed:
                      addProducts,
                    icon: const Icon(Icons.add,color: Colors.black,),
                    label: const Text('Add product',style: TextStyle(color: Colors.black),),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.greenAccent),
                    ),
                ),
                ElevatedButton.icon(
                    onPressed: (){},
                    icon: const Icon(Icons.clear_outlined,color: Colors.black,),
                    label: const Text('Clear Data',style: TextStyle(color: Colors.black),),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.redAccent),
                  ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
