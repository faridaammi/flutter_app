import 'package:appstest/DetailsProducts.dart';
import 'package:appstest/addProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';

class product extends StatefulWidget {
  const product({super.key});
  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  List products = [];
  Future getProducts(String q) async{
    List<dynamic> lstProduct ;
    var url = Uri.http("127.0.0.1:8000","api/produits",{"q":q});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      products.clear();
      setState(() {
        lstProduct = convert.jsonDecode(response.body);
        products.addAll(lstProduct);
        //print(products);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getProducts("");
    getProducts("");
    //print(products[0]['nom']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Product'
        ),
      ),
      body: products.isEmpty? const Center(child: CircularProgressIndicator()) :
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12,),
              TextFormField(
                style: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 12,
                    color: colorApp.colorPrimary),
                cursorColor: colorApp.colorPrimary,
                decoration: const InputDecoration(
                  filled: false,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: colorApp.colorGray,
                  ),
                  labelText: 'Search your Product',
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
              const SizedBox(height: 12,),
              GridView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: products.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,

              ),
                  itemBuilder: (context,index){
                    final int id = products[index]['id']; // Accessing the ID of fetched data
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> detailsProduct(id:id)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: Colors.redAccent.shade100,
                            ),
                            height: 120,
                            width: 180,
                            child: Image(
                              image: NetworkImage(products[index]["lien_image"],
                              ),),
                          ),
                          const SizedBox(height: 15,),
                           Row(
                            children: [
                               Text(
                                 products[index]["nom"],
                                 //"Title",
                                 style: const TextStyle(
                                fontFamily: "Poppins-SemiBold",fontSize: 12,
                              ),
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,),
                            ],
                          ),

                           Row(
                             mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${products[index]['prix']} MAD",
                                style: const TextStyle(
                                  fontFamily: "Poppins-SemiBold",fontSize: 14,color: Colors.redAccent
                              ),),
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.shopping_cart,color: Colors.white,size: 20,),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> addProduct()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
