import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class book extends StatefulWidget {
  const book({super.key});

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  TextEditingController search_controler = TextEditingController();
  final _controlScroll = ScrollController();
  List posts = [];
  Future getPost(String q) async{
    List<dynamic> lstPosts ;
    var url = Uri.http("jsonplaceholder.typicode.com","/posts",{"q":q});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      posts.clear();
      lstPosts = convert.jsonDecode(response.body);
      posts.addAll(lstPosts);
      setState(() {

      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost("");
    _controlScroll.addListener(_scrollListner);

   /* _controlScroll.addListener(() {
      if(_controlScroll.position.pixels == _controlScroll.position.maxScrollExtent)
      {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("This is max of scroll"),
          ));
        });
      }
      else{
        setState(() {
          print("scroll is long");
        });
      }
    });*/

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Books Google'
        ),
      ),
      body:
      posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 14,),
                TextFormField(
                  controller: search_controler,
                  style: const TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14,
                      color: colorApp.colorPrimary),
                  cursorColor: colorApp.colorPrimary,
                  decoration: const InputDecoration(
                    filled: false,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: colorApp.colorGray,
                    ),
                    labelText: 'Search your books',
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
                const SizedBox(height: 14),
                ElevatedButton(onPressed: (){
                  setState(() {
                    getPost(search_controler.text);
                  });
                }, child: const Text("test")),
                GridView.builder(
                  controller: _controlScroll,
                  physics: const ScrollPhysics(),
                  //itemCount: posts.length,
                  itemCount: 10,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return (
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 6,right: 6,top: 10,bottom: 6),
                          decoration: BoxDecoration(
                              color: colorApp.colorPrimary,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Column(
                            children: [
                              Text(
                                posts[index]["title"].toString(),
                                //"$posts['userId']",
                                style: const TextStyle(fontFamily: 'Poppins-SemiBold',fontSize: 12,color: colorApp.colorBackground),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                posts[index]["body"].toString(),
                                textAlign: TextAlign.start,
                                maxLines: 7,
                                //"$posts['userId']",
                                style:  TextStyle(fontFamily: 'Poppins-SemiBold',fontSize: 11,color: colorApp.colorBackground.withOpacity(0.5),),
                              ),
                            ],
                          ),)
                    );
                  },
            
                ),
              ],
            ),
          ),
        ),
    );
  }
  void _scrollListner(){
    if(_controlScroll.position.pixels == _controlScroll.position.maxScrollExtent) {
      print('fin scroll');
    }
  }
}

