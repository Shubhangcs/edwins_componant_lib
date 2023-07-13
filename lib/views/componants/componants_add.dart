import 'dart:convert';
import 'package:edwins_componant_lib/constants/constants.dart';
import 'package:edwins_componant_lib/views/login_page.dart';
import 'package:edwins_componant_lib/widgets/common/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComponantAdd extends StatefulWidget {
  const ComponantAdd({super.key});

  @override
  State<ComponantAdd> createState() => _ComponantAddState();
}

class _ComponantAddState extends State<ComponantAdd> {
  var icons = Icons.add_rounded;
  List data = [];
  static List userData = [];
  @override
  void initState() {
    super.initState();
    getcomponants();
  }

  Future<void> getcomponants() async {
    final response = await http.get(Uri.parse(componants));
    final res = jsonDecode(response.body);
    setState(() {
      data = res;
    });
  }

  var compbody = {"name": emailController.text, "items": userData};

  void uploadData() async {
    var res = await http.post(Uri.parse(addcomp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(compbody));
    var jsonResponse = jsonDecode(res.body);
    if(jsonResponse['status']){

    }
    else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopNav(
              title: 'Componants',
            ),
            SizedBox(
              height: 530,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 80,
                            margin: const EdgeInsets.only(left: 20),
                            child: Image.network(
                              data[index]['image'],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                  Text(
                                    data[index]['subtitle'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Quicksand',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: SizedBox(
                              width: 60,
                              height: 80,
                              child: Icon(
                                icons,
                                size: 25,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                userData.add(data[index]);
                                var snackBar = SnackBar(
                                  content: const Text('Componant added'),
                                  action: SnackBarAction(
                                    label: 'undo',
                                    onPressed: () {
                                      userData.remove(data[index]);
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              });
                              print(userData);
                              // print();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              ),
            ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(173, 0, 0, 0),
                ),
                child: const Center(
                  child: Text(
                    'Borrow',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onTap: () {
                uploadData();
                userData.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
